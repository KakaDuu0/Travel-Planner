import './models/user.dart';
import 'repository.dart';

class Service {
  Service();

  final User user = User.guest();
  bool isLoggedIn = false;
  final Repository repository = Repository();

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

    if (success) {
      isLoggedIn = true;
      updateUserInstance(uname);
    }

    return success;
  }

  bool register(String uname, String pwd, String email) {
    bool success = true;

    if (success) {
      isLoggedIn = true;
      updateUserInstance(uname, email: email);
    }

    return success;
  }

  void updateUserInstance(String username, {String email = ''}) {
    // Retrieve data from database
    user.setUsername(username);
    if (email != '') {
      user.setEmail(email);
    }
  }

  double getBudget() {
    return 0;
  }
}
