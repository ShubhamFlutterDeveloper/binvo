class Validators {
  String? validateName(String? name) {
    if ((name ?? "")
        .trim()
        .isEmpty) {
      return "Please enter full name";
    }
    return null;
  }

  String? validateNickName(String? name) {
    if ((name ?? "")
        .trim()
        .isEmpty) {
      return "Please enter name/nickname";
    }
    return null;
  }

  String? validateInterest(String? name) {
    if ((name ?? "")
        .trim()
        .isEmpty) {
      return "Please enter interest";
    }
    return null;
  }

  String? validateMobile(String ?value) {
    if (value!.isEmpty) {
      return 'Please enter mobile number';
    }
    else if (value.length < 10) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if ((password ?? "")
        .trim()
        .isEmpty) {
      return "Please enter password";
    }
    else if ((password ?? "")
        .trim()
        .length <= 5) {
      return "Password should be at least 6 characters long";
    }
    else {
      return null;
    }
  }


  String? validateConfirmPassword(String confirmPassword, String? newPassword) {
    if (confirmPassword
        .trim()
        .isEmpty) {
      return "Please enter confirm password";
    } else if (confirmPassword.trim() != newPassword?.trim()) {
      return "Confirm password doesn't match the password";
    }
    return null;
  }


  String? otherField(String? pwd) {
    if (pwd!.trim().isEmpty) return "Field can't be empty";
    return null;
  }

}