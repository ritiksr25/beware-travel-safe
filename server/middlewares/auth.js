const jwt = require("jsonwebtoken");

module.exports.allAuth = (req, res, next) => {
	const token = req.header("x-auth-token");
	if (!token)
		return res
			.status(401)
			.json({ message: "Access denied. No Token provided", error: true });

	const decodedPayload = jwt.verify(token, process.env.JWT_PRIVATE_KEY);
	req.user = decodedPayload;
	return next();
};

module.exports.userAuth = (req, res, next) => {
	const token = req.header("x-auth-token");
	if (!token)
		return res
			.status(401)
			.json({ message: "Access denied. No Token provided", error: true });

	const decodedPayload = jwt.verify(token, process.env.JWT_PRIVATE_KEY);
	if (!decodedPayload.isAdmin) {
		req.user = decodedPayload;
		return next();
	} else {
		return res.status(401).json({
			message: "Access denied. Not a valid user token",
			error: true
		});
	}
};

module.exports.adminAuth = (req, res, next) => {
	const token = req.header("x-auth-token");
	if (!token)
		return res
			.status(401)
			.json({ message: "Access denied. No Token provided", error: true });

	const decodedPayload = jwt.verify(token, process.env.JWT_PRIVATE_KEY);
	if (decodedPayload.isAdmin) {
		req.user = decodedPayload;
		return next();
	} else {
		return res.status(401).json({
			message: "Access denied. Not a valid admin token",
			error: true
		});
	}
};
