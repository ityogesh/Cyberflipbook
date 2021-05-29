class RegisterationResponse {
  bool success;
  String message;
  UserInformation data;

  RegisterationResponse({this.success, this.message, this.data});

  RegisterationResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new UserInformation.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class UserInformation {
  String sId;
  String userToken;
  String firstName;
  String lastName;
  String email;

  UserInformation({this.sId, this.userToken, this.firstName, this.lastName, this.email});

  UserInformation.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userToken = json['userToken'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userToken'] = this.userToken;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    return data;
  }
}
