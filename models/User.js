const mongoose = require("mongoose");
const jwt = require("jsonwebtoken");

require("dotenv").config();

const UserSchema = new mongoose.Schema({
	name: {
		type: String,
		required: true
	},
	email: {
		type: String,
		required: true
	},
	password: {
		type: String,
		required: true
	},
	isAdmin: {
		type: Boolean,
		default: false
	}
}, { timestamps: true });

UserSchema.methods.generateAuthToken = function() {
	const token = jwt.sign({
		id: this._id,
		name: this.name,
		email: this.email,
		isAdmin: this.isAdmin
	},
		process.env.JWT_PRIVATE_KEY
	);
	return token;
};

module.exports = User = mongoose.model("User", UserSchema);