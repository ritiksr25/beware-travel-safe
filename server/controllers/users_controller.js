module.exports.register = async (req, res) => {
    let { name, email, password, googleId } = req.body;
    let user = await User.findOne({ email });
    if (user) {
        res.status(400).json({
            message: "Email already in use.",
            error: true,
            data: null
        });
    } else {
        let newUser = {
            name: String(name).trim(),
            email: String(email).trim()
        };
        // if (googleId) {
        // 	newUser["googleId"] = googleId;
        // 	newUser["isGoogleSignIn"] = true;
        // } else {
        const salt = await bcrypt.genSalt(10);
        newUser["password"] = await bcrypt.hash(password, salt);
        // }
        user = await User.create(newUser);
        let token = user.generateAuthToken();
        res.status(200)
            .header("x-auth-token", token)
            .json({
                message: "Successfully Registered",
                error: false,
                data: user
            });
    }
};

module.exports.login = async (req, res) => {
    let { email, password, googleId } = req.body;
    let user = await User.findOne({ email });
    if (user) {
        let token = user.generateAuthToken();
        if (password) {
            let validPassword = await bcrypt.compare(
                String(password),
                String(user.password)
            );
            if (!validPassword) {
                // let data = {
                // 	isGoogleSignIn: user.isGoogleSignIn
                // };
                return res.status(403).json({
                    message: "Invalid password",
                    error: true,
                    data
                });
            }
            // } else if (googleId !== user.googleId) {
            // return res.status(403).json({
            // 	message: "Forbidden",
            // 	error: true,
            // 	data: null
            // });
            else {
                res.status(200)
                    .header("x-auth-token", token)
                    .json({
                        message: "Login Successful",
                        error: null,
                        data: user
                    });
            }
        } else {
            res.status(401).json({
                message: "Invalid User",
                error: true,
                data: null
            });
        }
    } else {
        res.status(401).json({
            message: "Invalid User",
            error: true,
            data: null
        });
    }
};

module.exports.profile = async (req, res) => {
    let user = await User.findById(req.user.id);
    if (user) {
        res.status(200).json({ message: "success", error: false, data: user });
    } else {
        res.status(400).json({
            message: "No User found",
            error: true,
            data: null
        });
    }
};
