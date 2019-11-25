class ViewProfile {
  String message;
  Data data;

  ViewProfile({this.message, this.data});

  ViewProfile.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  bool isAdmin;
  String sId;
  String name;
  String email;

  Data({this.isAdmin, this.sId, this.name, this.email});

  Data.fromJson(Map<String, dynamic> json) {
    isAdmin = json['isAdmin'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
  }
}
