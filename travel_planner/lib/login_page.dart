// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'service.dart';
import 'styles/login_register_page_styles.dart';

import 'styles/starter_page_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.service});

  final Service service;

  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  bool didLoginFail = false;
  bool isUsernameValid = false;
  bool isPasswordValid = false;
  TextEditingController pwdController = TextEditingController();
  TextEditingController unameController = TextEditingController();
  CustomInputDecoration usernameInputDecoration =
      const CustomInputDecoration('Username', '');
  CustomInputDecoration passwordInputDecoration =
      const CustomInputDecoration('Password', '');

  void validateUsername(String text) {
    setState(() {
      String err = widget.service.validateUsernameInput(text);
      usernameInputDecoration = CustomInputDecoration('Username', err);
      isUsernameValid = err == '' ? true : false;
    });
  }

  void validatePassword(String text) {
    setState(() {
      String err = widget.service.checkCorrectPassword(text);
      passwordInputDecoration = CustomInputDecoration('Password', err);
      isPasswordValid = err == '' ? true : false;
    });
  }

  /*void vibratePhone() async {
    if (await Vibration.hasVibrator() != null) {
      // Vibrate twice with a short pause in between
      Vibration.vibrate(pattern: [0, 50, 100, 50]);
    }
  }*/

  Future<void> login() async {
    setState(() {
      isLoading = true;
      didLoginFail = false;
    });
    validatePassword(pwdController.text);
    await Future.delayed(const Duration(seconds: 2));
    if (!isPasswordValid || !isUsernameValid) {
      setState(() {
        didLoginFail = true;
      });
    } else {
      widget.service.login(unameController.text, pwdController.text);
      setState(() {
        didLoginFail = false;
      });
    }

    setState(() {
      isLoading = false;
    });
    /*if (didLoginFail) {
      vibratePhone();
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.transparent,
        elevation: 0,
        highlightElevation: 0,
        focusElevation: 0,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        hoverElevation: 0,
        child: const Icon(Icons.arrow_back_ios),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: Text(
                'Login and plan your adventure!',
                style: GoogleFonts.getFont(
                  'Dancing Script',
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 80,
                    child: TextFormField(
                      controller: unameController,
                      onChanged: validateUsername,
                      decoration: usernameInputDecoration,
                      textAlignVertical: TextAlignVertical.center,
                    ),
                  ),
                  Container(
                    height: 80,
                    child: TextFormField(
                      controller: pwdController,
                      //onChanged: validatePassword,
                      decoration: passwordInputDecoration,
                      obscureText: true,
                      textAlignVertical: TextAlignVertical.center,
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedOpacity(
                        opacity: isLoading ? 1 : 0,
                        duration: const Duration(milliseconds: 800),
                        child: Container(
                          height: 52,
                          width: 302,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    !didLoginFail ? Colors.green : Colors.red,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(26),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          login();
                        },
                        style: const BtnStyle(Size(300, 50)),
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
