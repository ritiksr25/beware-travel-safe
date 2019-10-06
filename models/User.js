const mongoose = require('mongoose');
const jwt = require('jsonwebtoken');

require('dotenv').config();

const UserSchema = new mongoose.Schema(
	{
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
		role: {
			type: String,
			required: true
		}
	},
	{ timestamps: true }
);

module.exports = User = mongoose.model('User', UserSchema);
