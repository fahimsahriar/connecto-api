import Express from "express";
import { getPosts, addPost, getblood } from "../controller/posts.js";

const router = Express.Router();

router.get("/", getPosts);
router.get("/blood", getblood);
router.post("/add", addPost);

export default router;