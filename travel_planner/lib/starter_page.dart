import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'styles/starter_page_styles.dart';
import 'service.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({super.key, required this.s});

  final buttonSize = const Size(300, 50);
  final Service s;

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    // Create the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Create the animation
    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0.5, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInBack,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Welcome to Travel Planner',
                  style: GoogleFonts.getFont(
                    "Dancing Script",
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      _animationController.forward().then((value) => {
                            Navigator.pushNamed(context, '/login',
                                arguments: widget.s),
                            _animationController.reset()
                          });
                    },
                    style: BtnStyle(widget.buttonSize),
                    child: const Text('Login'),
                  ),
                  const SizedBox(
                    height: 50,
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          ' or ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _animationController.forward().then((value) => {
                            Navigator.pushNamed(context, '/register',
                                arguments: widget.s),
                            _animationController.reset()
                          });
                    },
                    style: BtnStyle(widget.buttonSize),
                    child: const Text("Sign Up"),
                  ),
                  const SizedBox(
                    width: 150,
                    child: Text(
                      'You can also login with:',
                      style: TextStyle(
                        color: Colors.grey,
                        height: 3,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: true),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.apple),
                        color: Colors.white,
                        iconSize: 50.0,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'images/google_logo.png',
                        ),
                        iconSize: 38.0,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 150,
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _animationController.forward().then((value) => {
                            Navigator.pushNamed(context, '/home',
                                arguments: widget.s),
                            _animationController.reset()
                          });
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: const Text('Continue as guest'),
                  ),
                ],
              ),
            ),
            SlideTransition(
              position: _animation,
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: const Image(
                  image: AssetImage('images/flying-airplane.gif'),
                  height: 100,
                  width: 300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
