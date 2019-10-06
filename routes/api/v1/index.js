const express = require('express');
const router = express.Router();

// load controller
const { index } = require('../../../controllers/index_controller');
// middlewares

// index route
router.get('/', index);

// export router
module.exports = router;