module.exports.getData = async (req, res) => {
    let { type, id } = req.query;
    let filter = {};
    if (type) filter.type = type;
    let data;
    if(id){
        data = await Location.findById(id);
    } else {
        data = await Location.find(filter).sort({ createdAt: "desc" });
    }
    res.status(200).json({ message: "success", error: false, data });
};

module.exports.addData = async (req, res) => {
    let data = await Location.create(req.body);
    res.status(200).json({ message: "success", error: false, data });
};

module.exports.updateData = async (req, res) => {
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
