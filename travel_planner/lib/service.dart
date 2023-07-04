class Service {
  const Service();
  String validateUsernameInput(String text) {
    String err = '';

    if (text.length < 3) err = 'Username must be of at least 3 characters!';
    // else if not in database ..

    return err;
  }

  String validatePassword(String text) {
    String err = '';
    if (text.length < 8) {
      err = 'Password must be at least 8 characters!';
    } else if (!text.contains(RegExp('[a-z]'))) {
      err = 'Password must contain small and big characters!';
    } else if (!text.contains(RegExp('[A-Z]'))) {
      err = 'Password must contain small and big characters!';
    } else if (!text.contains(RegExp('[0-9]'))) {
      err = 'Password must conatin at least one number';
    } else if (!text.contains(RegExp('[.!@#]'))) {
      err = 'Password must contain at least one special character (.!@#)!';
    }

    return err;
  }

  String checkCorrectPassword(String text) {
    String err = '';
    //check database
    //for (int i = 0; i < 10000; ++i) for (int j = 0; j < 500000; ++j);

    return err;
  }

  String validateEmail(String text) {
    String err = '';
    // ignore: unnecessary_string_escapes
    if (!text.contains(RegExp('.{3,}@.{2,}\..{2,}'))) {
      err = 'Invalid Email!';
    }
    return err;
  }

  bool login(String uname, String pwd) {
    bool success = true;

    return success;
  }
}
