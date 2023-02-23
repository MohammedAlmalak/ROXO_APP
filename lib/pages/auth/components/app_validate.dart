import 'package:validators/validators.dart' as validatore;

class Appvalidate {
  //! message
  static const _messageEnterValue = "Error";
  static const _messagecorrectEmail = "Error";
  static const _messagecorrectpassword = "Error";
  static const _messageequalpassword = "Error";
  static const _messageCorrectPhoneNum = "Error";
  //! email
  static String? isEmail(String? value) {
    if (value!.isEmpty) {
      return _messageEnterValue;
    } else if (!validatore.isEmail(value)) {
      return _messagecorrectEmail;
    } else {
      return null;
    }
  }

  //! password
  static String? isPass(String? value) {
    if (value!.isEmpty) {
      return _messageEnterValue;
    } else if (!validatore.isLength(value, 6)) {
      return _messagecorrectpassword;
    } else {
      return null;
    }
  }

  //! LastName
  static String? name(String? value) {
    if (value!.trim().isEmpty) {
      return _messageEnterValue;
    } else {
      return null;
    }
  }

  //! password isEqualPass
  static String? isEqualPass(String? value, String pass) {
    if (value!.isEmpty) {
      return _messageEnterValue;
    } else if (!validatore.equals(value, pass)) {
      return _messageequalpassword;
    } else {
      return null;
    }
  }

  //! is embty
  static String? isEmpty(String? value) {
    if (value!.isEmpty) {
      return _messageEnterValue;
    }
    return null;
  }

  //! phone number
  static String? isPhoneNue(String? value) {
    if (value!.trim().isEmpty) {
      return _messageEnterValue;
    } else if (!validatore.isLength(value, 10, 10)) {
      return _messageCorrectPhoneNum;
    }
    return null;
  }
}
