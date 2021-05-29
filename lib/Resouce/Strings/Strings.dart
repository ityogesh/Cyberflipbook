//import 'package:flutter/material.dart';

class MHConstants {
  static var securelogin = 'Secure Sign in';
  static var securesignup = 'Secure Sign Up';
  static var logintext = 'Please enter your credentials to proceed';
  static var profile = 'My Profile';
  static var email = 'EMAIL ADDRESS';
  static var password = 'PASSWORD';
  static var newpassword = 'NEW PASSWORD';
  static var confirmpassword = 'CONFIRM PASSWORD';
  static var lep = 'Law \nEnforcement \nPersonnel';
  static var admin = 'Administrator';
  static var signup = "Don't have an account?";
  static var signup1 = 'Sign up';
  static var signin = 'Already have an account?';
  static var signin1 = 'Sign in';
  static var forgot = 'Forgot Password?';
  static var forgottext = 'Continue with your credentials?';
  static var firstname = 'FIRST NAME';
  static var lastname = 'LAST NAME';
  static var phone = 'PHONE NUMBER';
  static var securityQuestion = 'SECURITY QUESTIONS';
  static var securityQuestion1 = 'Security Questions';
  static var question1 = 'WHO IS YOUR BOSS?';
  static var question2 = 'WHO IS YOUR BEST FRIEND?';
  static var question3 = 'WHAT WAS YOUR FIRST CAR NAME?';
  static var iHaveReadTermsAndConditions = 'I have read and accept the';
  static var termsAndConditions = 'Terms and Condition';
  static var pleaseAcceptTermsAndConditions =
      'Please accept the terms and conditions to proceed...';
  static var pleasEnterMailAddress =
      "Please enter your email address to reset \n"
      "                    your password";
  static var newPassword = 'Please enter your email id to reset your';
  static var alreadyHaveCode = 'I already have a code';
  static var login = 'Sign In';
  static var loginWithFB = 'Login With Facebook';
  static var forgotPassword = 'Forgot Password';
  static var register = 'Create Account';
  static var entercode = 'ENTER CODE';
  static var sendcode = 'Submit';
  static var cancel = 'CANCEL';
  static var attempt = 'Attempt 1/5';
  static var resetpass = 'Reset Password';
  static var factorverify = 'Two Factor Verification';
  static var biometric = 'Biometric Enable';
  static var biometrictext = '''Do you want enable biometric to secure
                 authentication?''';
  static var note = '''Note:Two Factor Verification will be enabled 
      default if you disabled this feature.''';
  static var biometricbutton = 'Enable';
  static var factorcode = 'ENTER YOUR VERIFICATION CODE';
  static var verifyIdentity = 'Verify your Identity';
  static var verifyText = '''Use your finger print or face scanner 
          to verify your identity''';
  static var passwordShouldContain =
      'Password should contain 10-16 characters made up of:\nUppercase letters(A-Z),\nLowercase letters(a-z),\nNumbers(0-9),\nand special characters(!@#%^&*+)';
  static var changePassword = 'Change Password';
  static var emailIdCannotBeEmpty = 'Email Id cannot be empty';
  static var enterValidEmailId = 'Must be name@email.com ';
  static var firstnameCannotBeEmpty = 'First Name cannot be empty';
  static var enterValidFirstname = 'Atleast 3 letters required ';
  static var lastnameCannotBeEmpty = 'Last Name cannot be empty';
  static var enterValidlastname = 'Last Name Must have a letter ';
  static var enterQuestion = 'Fill all Question';
  static var questionCannotBeEmpty = 'Security Question cannot be empty';
  static var codeCannotBeEmpty = 'Reset Code cannot be empty';
  static var enterValidcode = '4 digit code required ';
  static var passwordCannotBeEmpty = 'Password cannot be empty';
  static var passwordShouldBeProper =
      'Password should contain 10-16\ncharacters made up of:\nUppercase letters(A-Z),\nLowercase letters(a-z),\nNumbers(0-9),\nand special characters(!@#%^&*+).';
  static var confirmPasswordCannotBeEmpty = 'Password cannot be empty';
  static var confirmPasswordShouldBeProper =
      "Confirm password should be same as Password";
  static var somethingWentWrong =
      'Something went wrong. Please try again later';
  static var phoneCannotBeEmpty = 'Phone No. cannot be empty';
  static var phoneShouldProper = 'Please Enter Valid Phone Number';
  static var report = 'Report';
  static var showmore = 'Show More';
  static var showless = 'Show Less';
  static var photos = 'PHOTOS';
  static var videos = 'VIDEOS';
  static var followers = 'Followers';
  static var following = 'Following';
  static var follow = 'Follow';
  static var unFollow = 'UnFollow';
  static var newsFeed = 'NEWS FEED';
}

class Drop {
  var dype;
  String name;
  final image;
  Drop(this.dype, this.image, this.name);
}

List<Map> getDrops = [
  {'name': 'USA', 'image': 'assets/united-states-emoji.png'},
  {'name': 'Canda', 'image': 'assets/canada-emoji.png'},
  {'name': 'European Union', 'image': 'assets/european-union-emoji.png'}
];

class Juris {
  final String type;
  const Juris(this.type);
}

const List<Juris> getJuris = <Juris>[
  Juris('NYPD'),
  Juris('DANY'),
  Juris('MPPD')
];
