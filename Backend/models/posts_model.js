const mongoose = require("mongoose");

var Schema = mongoose.Schema;

var PostsSchema = new Schema({
    _id: mongoose.Schema.Types.ObjectId,
    fileName: String,
    caption: String,
    user: String,
    college: String,
    likes: Number,
    comments: Number,
    timeStamp: String
});
//need to remove likes and comments count from this model
module.exports = mongoose.model("posts", PostsSchema);
