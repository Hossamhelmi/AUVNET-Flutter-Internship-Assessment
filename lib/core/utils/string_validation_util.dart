class StringValidationUtil {
  static bool isValidateEmail(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }

  static bool isValidPhone(String phone) {
    return RegExp(r"^[0-9]{10,15}$").hasMatch(phone);
  }

  static bool isValidatePassword(String password) {
    return RegExp(r'^.{5,}$').hasMatch(password);
  }
}
