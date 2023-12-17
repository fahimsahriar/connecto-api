import { db } from "../connect.js";
import jwt from "jsonwebtoken";
import moment from "moment";

export const getPosts = (req, res) => {
  const token = req.cookies.accessToken;
  const userId = req.query.userId;
  if (!token) return res.status(401).json("Not logged in!");

  jwt.verify(token, "secretkey", (err, userInfo) => {
    if (err) return res.status(403).json("Token is not valid!");
    const q = userId !== "undefined" ? `SELECT p.*, u.id AS userId, name, profilePic FROM posts AS p JOIN users AS u ON (u.id = p.userid) WHERE p.userid = ? ORDER BY p.createdAt DESC`
    :`SELECT p.*, u.id AS userId, name, profilePic FROM posts AS p JOIN users AS u ON (u.id = p.userid) LEFT JOIN follwers AS r ON (p.userid = r.followedUserId) WHERE r.follwerUserid= 1 OR p.userId =1 ORDER BY p.createdAt desc`;

    const values =
      userId !== "undefined" ? [userId] : [userInfo.id, userInfo.id];
    db.query(q,values, (err, data) => {
      if (err) return res.status(500).json(err);
      return res.status(200).json(data);
    });
  });
};
export const getblood = (req, res) => {
  const token = req.cookies.accessToken;
  const userId = req.query.userId;
  if (!token) return res.status(401).json("Not logged in!");

  jwt.verify(token, "secretkey", (err) => {
    if (err) return res.status(403).json("Token is not valid!");
    const q = `SELECT p.*, u.id AS userId, name, profilePic FROM posts AS p JOIN users AS u ON (u.id = p.userid) WHERE p.blood = 1 ORDER BY p.createdAt desc`;

    db.query(q, (err, data) => {
      if (err) return res.status(500).json(err);
      return res.status(200).json(data);
    });
  });
};



export const addPost = (req, res) => {
  // return res.status(200).json("Not logged in!");
  const token = req.cookies.accessToken;
  if (!token) return res.status(401).json("Not logged in!");

  jwt.verify(token, "secretkey", (err, userInfo) => {
    if (err) return res.status(403).json("Token is not valid!");

    const q =
      "INSERT INTO posts(`description`, `img`, `createdAt`, `userid`, `bloodGroup`, `location`, `blood`) VALUES (?)";
    const values = [
      req.body.description,
      req.body.img,
      moment(Date.now()).format("YYYY-MM-DD HH:mm:ss"),
      userInfo.id,
      req.body.bloodGroup,
      req.body.location,
      req.body.blood,
    ];
    //return res.status(200).json(values);
    db.query(q, [values], (err, data) => {
      if (err) return res.status(500).json(err);
      return res.status(200).json("Post has been created.");
    });
  });
};
