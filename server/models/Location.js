const mongoose = require("mongoose");

const LocationSchema = new mongoose.Schema(
  {
    latitude: { type: Number },
    longitude: { type: Number },
    type: { type: String, enum: ["crime", "accident"] }
  },
  { timestamps: true }
);

module.exports = Location = mongoose.model("Location", LocationSchema);
