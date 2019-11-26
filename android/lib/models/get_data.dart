class GetData {
  String sId;
  double latitude;
  double longitude;
  String type;

  GetData({this.sId, this.latitude, this.longitude, this.type});

  GetData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['type'] = this.type;
    return data;
  }
}
