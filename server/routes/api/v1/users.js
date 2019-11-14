const express = require("express");
const router = express.Router();

// load controller
const {
	register,
	login,
	profile
} = require("../../../controllers/users_controller");

// middlewares
const { catchErrors } = require("../../../config/errorHandler");
const { allAuth } = require("../../../middlewares/auth");
// routes
router.post("/register", catchErrors(register));
router.post("/login", catchErrors(login));
router.get("/profile", allAuth, catchErrors(profile));

// export router
module.exports = router;
