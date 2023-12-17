import express from "express";
import userRoutes from "./routes/users.js";
import postsRoutes from "./routes/posts.js";
import commentsRoutes from "./routes/comments.js";
import likesRoutes from "./routes/likes.js";
import authRoutes from "./routes/auth.js";
import relationshipRoutes from "./routes/relationship.js";
import cors from "cors";
import cookieParser from "cookie-parser";
import multer from "multer";

const app = express();

//middleware
app.use((req, res, next) => {
  res.header("Access-Control-Allow-Credentials", true);
  next();
});
app.use(express.json());
app.use(
  cors({
    //react frontend showing port, can be varied for other pc
    origin: "http://localhost:5173",
  })
);
app.use(cookieParser());



//image upload
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, '../Connecto/public/images/')
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9)
    cb(null, Date.now() + file.originalname)
  }
})

const upload = multer({ storage: storage })

app.post("/api/upload", upload.single("file"), (req, res) => {
  const file = req.file;
  res.status(200).json(file.filename);
});

app.use("/api/users/", userRoutes);
app.use("/api/posts/", postsRoutes);
app.use("/api/comments/", commentsRoutes);
app.use("/api/likes/", likesRoutes);
app.use("/api/auth/", authRoutes);
app.use("/api/relationships", relationshipRoutes);

app.listen(8800, () => {
  console.log("Working");
});
