const mongoose = require("mongoose");

const schema = mongoose.Schema({
  email: String,
  comment: String,
  content_id: Number
 
});

module.exports = mongoose.model("Post", schema);
