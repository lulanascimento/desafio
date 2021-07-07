const express = require("express");
const mongoose = require("mongoose");
const routes = require("./routes");
const morgan = require('morgan');


// Adicionando logs do mongoose
mongoose.set('debug', true);

mongoose
  .connect("mongodb://mongo:27017/acmedb", { useNewUrlParser: true,  useUnifiedTopology: true })
  .then(() => {
    const app = express();
    app.use(express.json());
    app.use("/api", routes);
    app.use(morgan('combined'));

    app.listen(3000, () => {
      console.log("API UP!!");
    });
  });
