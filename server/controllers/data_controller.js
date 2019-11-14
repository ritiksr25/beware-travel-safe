module.exports.getData = async (req, res) => {
    let { type } = req.query;
    let data = await Location.find({ type }).sort({ createdAt: "desc" });
    res.status(200).json({ message: "success", error: false, data });
};

module.exports.addData = async (req, res) => {
    let { latitude, longitude, type } = req.body;
    if (!latitude || !longitude || !type) {
        return res
            .status(400)
            .json({ message: "Invalid Data.", error: true, data: null });
    } else if (Number(latitude) < -90 || Number(latitude) > 90) {
        return res.status(400).json({
            message: "Latitude must be between -90 and 90",
            error: true,
            data: null
        });
    } else if (Number(longitude) < -180 || Number(longitude) > 180) {
        return res.status(400).json({
            message: "Longitude must be between -180 and 180",
            error: true,
            data: null
        });
    } else {
        let data = await Location.create(req.body);
        res.status(200).json({ message: "success", error: false, data });
    }
};

module.exports.updateData = async (req, res) => {
    let { latitude, longitude, type } = req.body;
    if (!latitude || !longitude || !type) {
        return res
            .status(400)
            .json({ message: "Invalid Data.", error: true, data: null });
    } else if (Number(latitude) < -90 || Number(latitude) > 90) {
        return res.status(400).json({
            message: "Latitude must be between -90 and 90",
            error: true,
            data: null
        });
    } else if (Number(longitude) < -180 || Number(longitude) > 180) {
        return res.status(400).json({
            message: "Longitude must be between -180 and 180",
            error: true,
            data: null
        });
    } else {
        let data = await Location.findById(req.params.id);
        if (data) {
            data.latitude = latitude;
            data.longitude = longitude;
            data.type = type;
            await data.save();
            data = await Location.findById(req.params.id);
            res.status(200).json({ message: "success", error: false, data });
        } else {
            res.status(400).json({
                message: "Invalid Location",
                error: true,
                data: null
            });
        }
    }
};

module.exports.deleteData = async (req, res) => {
    let data = await Location.findById(req.params.id);
    if (data) {
        await data.delete();
        res.status(200).json({ message: "success", error: false, data: null });
    } else {
        res.status(400).json({
            message: "Invalid Location",
            error: true,
            data: null
        });
    }
};
