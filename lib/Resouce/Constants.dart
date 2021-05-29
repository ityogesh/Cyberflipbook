enum LoginTypes { emailPassword, facebook, google }
enum LoginButtonTypes { login, facebook, forgotPassword, register }
enum AdminLepButtonTypes { lep, admin }
enum RegistrationFieldTypes {
  firstName,
  lastName,
  phone,
  email,
  password,
  confirmPassword,
  resetCode,
  question1,
  question2,
  question3,
}
enum ImageTypes { logo, logo2, profile, commentimage }
/*
class ApiConstants {
  static const baseURL =
      'ec2-54-206-6-239.ap-southeast-2.compute.amazonaws.com';
  static const termsAndConditions =
      'https://df.motohub.online/motohubterms.html';
  static const newsFeedPostPictureURL =
      'https://s3-ap-southeast-2.amazonaws.com/motohub-live/Post/Picture/';
  static const profilePictureURL =
      'https://s3-ap-southeast-2.amazonaws.com/motohub-live/Profile/ProfilePicture/';
  static const coverImageURL =
      'https://s3-ap-southeast-2.amazonaws.com/motohub-live/Profile/CoverPicture/';
  static const videoThumbNailURL =
      'https://s3-ap-southeast-2.amazonaws.com/motohub-live/Post/Video/';
}

String convertToAgo(index, String date, {bool numericDates = true}) {
  DateTime input = DateTime.parse(date);
  Duration diff = DateTime.now().difference(input);
  if ((diff.inDays / 365).floor() >= 2) {
    return '${(diff.inDays / 365).floor()} years ago';
  } else if ((diff.inDays / 365).floor() >= 1) {
    return (numericDates) ? '1 year ago' : 'Last year';
  } else if ((diff.inDays / 30).floor() >= 2) {
    return '${(diff.inDays / 30).floor()} months ago';
  } else if ((diff.inDays / 30).floor() >= 1) {
    return (numericDates) ? '1 month ago' : 'Last month';
  } else if ((diff.inDays / 7).floor() >= 2) {
    return '${(diff.inDays / 7).floor()} weeks ago';
  } else if ((diff.inDays / 7).floor() >= 1) {
    return (numericDates) ? '1 week ago' : 'Last week';
  } else if (diff.inDays >= 2) {
    return '${diff.inDays} days ago';
  } else if (diff.inDays >= 1) {
    return (numericDates) ? '1 day ago' : 'Yesterday';
  } else if (diff.inHours >= 2) {
    return '${diff.inHours} hours ago';
  } else if (diff.inHours >= 1) {
    return (numericDates) ? '1 hour ago' : 'An hour ago';
  } else if (diff.inMinutes >= 2) {
    return '${diff.inMinutes} minutes ago';
  } else if (diff.inMinutes >= 1) {
    return (numericDates) ? '1 minute ago' : 'A minute ago';
  } else if (diff.inSeconds >= 3) {
    return '${diff.inSeconds} seconds ago';
  } else {
    return 'Just now';
  }
}
*/