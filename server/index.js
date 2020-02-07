const express = require("express");
const bodyParser = require("body-parser");
const path = require("path");
const compression = require("compression");
const { notFound, sendErrors } = require("./config/errorHandler");
const app = express();

const cors = require("cors");
require("dotenv").config();
require("./config/dbconnection");
// require("./config/passport")(passport);

app.set("view engine", "ejs");
app.use(compression());
app.use(express.static(path.join(__dirname, "public")));
app.use(cors({ exposedHeaders: "x-auth-token" }));
app.use(
    bodyParser.urlencoded({
        limit: "50mb",
        extended: true,
        parameterLimit: 1000000
    })
);
app.use(
    bodyParser.json({
        limit: "50mb",
        extended: true,
        parameterLimit: 1000000
    })
);

//load Schemas
const User = require("./models/User");

//Routes
// app.use("/", require("./routes/render/main"));
app.use("/api/v1", require("./routes/api/v1/index"));

app.use("*", notFound);

//Error Handlers
app.use(sendErrors);

//Setting up server
startServer = async () => {
    try {
        await app.listen(process.env.PORT);
        console.log(`Server is up and running on Port ${process.env.PORT}`);
    } catch (err) {
        console.log("Error in running server.");
    }
};
startServer();
