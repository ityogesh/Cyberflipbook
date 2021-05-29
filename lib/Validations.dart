import 'Resouce/Strings/Strings.dart';

class Validations {
  static String validateEmail(String email) {
    if (email.isEmpty) {
      return MHConstants.emailIdCannotBeEmpty;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+[a-zA-Z]+[a-zA-Z]")
        .hasMatch(email)) {
      return MHConstants.enterValidEmailId;
    }
    return null;
  }

  static String validateFirstName(String firstname) {
    if (firstname.isEmpty)
      return MHConstants.firstnameCannotBeEmpty;
    else if (firstname.length < 3) {
      return MHConstants.enterValidFirstname;
    } else if (!RegExp("^[a-zA-Z]").hasMatch(firstname)) {
      return MHConstants.enterValidFirstname;
    }
    return null;
  }

  static String validateLastName(String lastname) {
    if (lastname.isEmpty)
      return MHConstants.lastnameCannotBeEmpty;
    else if (!RegExp("^[a-zA-Z]").hasMatch(lastname)) {
      return MHConstants.enterValidlastname;
    }

    return null;
  }

  static String validateQuestion(String question) {
    if (question.isEmpty)
      return MHConstants.questionCannotBeEmpty;
    else if (!RegExp("^[a-zA-Z]").hasMatch(question)) {
      return MHConstants.enterQuestion;
    }

    return null;
  }

  static String validatePassword(String password) {
    //  passwordvalue = password;
    if (password.isEmpty) {
      return MHConstants.passwordCannotBeEmpty;
    } else if (!RegExp("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])")
        .hasMatch(password)) {
      return MHConstants.passwordShouldBeProper;
    }
    return null;
  }

  static String validatePhone(var phone) {
    if (phone.isEmpty) {
      return MHConstants.phoneCannotBeEmpty;
    }
    if (!RegExp(r"^(?:[+0]9)?[0-9]{10}$").hasMatch(phone)) {
      return MHConstants.phoneShouldProper;
    }
    return null;
  }

  static String validateConfirmPassword(
      String confirmpassword, String password) {
    if (confirmpassword.isEmpty) {
      return MHConstants.confirmPasswordCannotBeEmpty;
    } else if (password != confirmpassword) {
      return MHConstants.confirmPasswordShouldBeProper;
    }
    return null;
  }

  static String validateResetCode(String resetcode) {
    if (resetcode.isEmpty) {
      return MHConstants.codeCannotBeEmpty;
    } else if (resetcode.length != 4) {
      return MHConstants.enterValidcode;
    } else if (!RegExp(r'^(?:[+0]9)?[0-9]{4}$').hasMatch(resetcode)) {
      return MHConstants.enterValidcode;
    }
    return null;
  }
}
