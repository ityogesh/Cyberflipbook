//Response for Login API,hit otp,hit code,Fblogintoken API******
class User {
  bool success;
  String message;
  Data1 data;

  User({this.success, this.message, this.data});

  User.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data1.fromJson(json['data']) : null;
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

class Data1 {
  String sId;
  String userToken;
  String firstName;
  String lastName;
  String email;
  int followingCount;
  int followerCount;
  int photosCount;
  int videosCount;

  Data1(
      {this.sId,
      this.userToken,
      this.firstName,
      this.lastName,
      this.email,
      this.followingCount,
      this.followerCount,
      this.photosCount,
      this.videosCount});

  Data1.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userToken = json['userToken'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    followingCount = json['followingCount'];
    followerCount = json['followerCount'];
    photosCount = json['photosCount'];
    videosCount = json['videosCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userToken'] = this.userToken;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['followingCount'] = this.followingCount;
    data['followerCount'] = this.followerCount;
    data['photosCount'] = this.photosCount;
    data['videosCount'] = this.videosCount;
    return data;
  }
}
