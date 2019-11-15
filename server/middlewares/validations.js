let emailRegex = /^\S+@\S+\.\S+/,
    passwordRegex = /^[\S]{8,}/;

module.exports.userValidation = (req, res, next) => {
    let { name, email, password } = req.body;
    if (!email || !name || !password) {
        return res
            .status(400)
            .json({
                message: "All fields are mandatory",
                error: true,
                data: req.body
            });
    }
    if (emailRegex.test(String(email))) {
        if (passwordRegex.test(String(password))) {
            return next();
        } else {
            res.status(400).json({
                message: "Password must be atleast 8 characters long",
                error: true,
                data: req.body
            });
        }
    } else {
        res.status(400).json({
            message: "EmailID is not valid",
            error: true,
            data: req.body
        });
    }
};

module.exports.dataValidation = (req, res, next) => {
    let { latitude, longitude, type } = req.body;
    if (!latitude || !longitude || !type) {
        return res
            .status(400)
            .json({ message: "Invalid Data.", error: true, data: req.body });
    } else if (Number(latitude) < -90 || Number(latitude) > 90) {
        return res.status(400).json({
            message: "Latitude must be between -90 and 90",
            error: true,
            data: req.body
        });
    } else if (Number(longitude) < -180 || Number(longitude) > 180) {
        return res.status(400).json({
            message: "Longitude must be between -180 and 180",
            error: true,
            data: req.body
        });
    } else {
        return next();
    }
};
