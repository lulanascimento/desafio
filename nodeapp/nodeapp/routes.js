const express = require("express");
const Post = require("./models/Post");
const router = express.Router();

router.get("/comment/list", async (req, res) => {
  const posts = await Post.find();
  res.send(posts);
});

//
router.post("/comment/new", async (req, res) => {
  const post = new Post({
    email: req.body.email,
    comment: req.body.comment,
    content_id: req.body.content_id
  });
  await post.save();
  res.send(post);
});

router.get("/comment/list:content_id", async (req, res) => {
  try {
    const post = await Post.find({ content_id: req.params.content_id });
    res.send(post);
  } catch {
    res.status(404);
    res.send({ error: "Post não existe!" });
  }
});

router.get("/comment/list/:id", async (req, res) => {
  try {
    const post = await Post.find({ content_id: req.params.id });
    res.send(post);
  
  } catch {
    res.status(404);
    res.send({ error: "Post doesn't exist!" });
  }
});




router.patch("/posts/:id", async (req, res) => {
  try {
    const post = await Post.find({ _id: req.params.id });

    if (req.body.title) {
      post.title = req.body.title;
    }

    if (req.body.content) {
      post.content = req.body.content;
    }

    await post.save();
    res.send(post);
  } catch {
    res.status(404);
    res.send({ error: "Post doesn't exist!" });
  }
});

router.delete("/posts/:id", async (req, res) => {
  try {
    await Post.deleteOne({ _id: req.params.id });
    res.status(204).send();
  } catch {
    res.status(404);
    res.send({ error: "Post doesn't exist!" });
  }
});

module.exports = router;
