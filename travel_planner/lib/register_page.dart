// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'service.dart';
import 'styles/login_register_page_styles.dart';
import 'styles/starter_page_styles.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.service});

  final Service service;

  @override
  State<StatefulWidget> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  bool isLoading = false;
  bool didRegisterFail = false;
  bool isUsernameValid = false;
  bool isEmailValid = false;
  bool isPasswordValid = false;
  CustomInputDecoration usernameInputDecoration =
      const CustomInputDecoration('Username', '');
  CustomInputDecoration emailInputDecoration =
      const CustomInputDecoration('Email', '');
  CustomInputDecoration passwordInputDecoration =
      const CustomInputDecoration('Password', '');
  CustomInputDecoration passwordVInputDecoration =
      const CustomInputDecoration('Validate Password', '');

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController pwdVController = TextEditingController();

  void validateUsername(String text) {
    setState(() {
      String err = widget.service.validateUsernameInput(text);
      usernameInputDecoration = CustomInputDecoration('Username', err);
      isUsernameValid = err == '' ? true : false;
    });
  }

  void validateEmail(String text) {
    setState(() {
      String err = widget.service.validateEmail(text);
      emailInputDecoration = CustomInputDecoration('Email', err);
      isEmailValid = err == '' ? true : false;
    });
  }

  void validatePassword(String text) {
    setState(() {
      String err = widget.service.validatePassword(text);
      if (err == '' && text != pwdVController.text) {
        err = 'Passwords do not match!';
      }
      passwordInputDecoration = CustomInputDecoration('Password', err);
      passwordVInputDecoration =
          CustomInputDecoration('Validate Password', err);
      isPasswordValid = err == '' ? true : false;
    });
  }

  void validateVPassword(String text) {
    setState(() {
      if (text != pwdController.text) {
        passwordVInputDecoration = const CustomInputDecoration(
            'Validate Password', 'Passwords do not match!');
      } else {
        validatePassword(text);
      }
    });
  }

  Future<void> register() async {
    setState(() {
      didRegisterFail = false;
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    if (isEmailValid && isUsernameValid && isPasswordValid) {
      didRegisterFail = !widget.service.register(
          usernameController.text, emailController.text, pwdController.text);
    } else {
      didRegisterFail = true;
    }

    setState(() {
      isLoading = false;
    });
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
                'Register',
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
                      controller: usernameController,
                      onChanged: validateUsername,
                      decoration: usernameInputDecoration,
                      textAlignVertical: TextAlignVertical.center,
                    ),
                  ),
                  Container(
                    height: 80,
                    child: TextFormField(
                      controller: emailController,
                      onChanged: validateEmail,
                      decoration: emailInputDecoration,
                      textAlignVertical: TextAlignVertical.center,
                    ),
                  ),
                  Container(
                    height: 80,
                    child: TextFormField(
                      controller: pwdController,
                      onChanged: validatePassword,
                      decoration: passwordInputDecoration,
                      autocorrect: false,
                      enableSuggestions: false,
                      obscureText: true,
                      textAlignVertical: TextAlignVertical.center,
                    ),
                  ),
                  Container(
                    height: 80,
                    child: TextFormField(
                      controller: pwdVController,
                      onChanged: validateVPassword,
                      decoration: passwordVInputDecoration,
                      autocorrect: false,
                      enableSuggestions: false,
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
                                color: !didRegisterFail
                                    ? Colors.green
                                    : Colors.red,
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
                          register();
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
