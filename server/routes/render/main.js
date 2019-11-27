const express = require("express");
const router = express.Router();

// routes
router.get("/", (req, res) => {
    res.render("/index");
});

router.get("/dashboard", async (req, res) => {
    let { type, id } = req.query;
    let filter = {};
    if (type) filter.type = type;
    let data;
    if(id){
        data = await Location.findById(id);
    } else {
        data = await Location.find(filter).sort({ createdAt: "desc" });
    }
    res.render("/dashboard", { data });
});

router.get("/add", (req, res) => {
    res.render("/add");
});

router.post("/add", (req, res) => {
    let data = await Location.create(req.body);
    res.redirect("/dashboard");
});

router.get("/update/:id", (req, res) => {
    res.render("/update");
});

router.post("/update/:id", (req, res) => {
    res.render("/dashboard");
});

// export router
module.exports = router;
