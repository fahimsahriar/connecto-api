import Express from "express";
import { getComments, addComment } from "../controller/comments.js";

const router = Express.Router();

router.get("/", getComments);
router.post("/", addComment);

export default router;