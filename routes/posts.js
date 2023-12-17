import Express from "express";
import { getPosts, addPost, getblood, deletePost } from "../controller/posts.js";

const router = Express.Router();

router.get("/", getPosts);
router.get("/blood", getblood);
router.post("/add", addPost);
router.delete("/:id", deletePost);

export default router;