const express = require("express");
const router = express.Router();

// load controller
const {
    getData,
    addData,
    updateData,
    deleteData
} = require("../../../controllers/data_controller");

// middlewares
const { catchErrors } = require("../../../config/errorHandler");
const { allAuth, adminAuth } = require("../../../middlewares/auth");

// routes
router.get("/", allAuth, catchErrors(getData));
router.post("/", adminAuth, catchErrors(addData));
router.put("/:id", adminAuth, catchErrors(updateData));
router.delete("/:id", adminAuth, catchErrors(deleteData));

// export router
module.exports = router;
