import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'styles/starter-page-styles.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({super.key});

  final buttonSize = const Size(300, 50);

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    // Create the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Create the animation
    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0.5, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: 
            MainAxisAlignment.center,
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
                        _animationController.forward().then((value) => Navigator.pushNamed(context, '/login'));
                      },
                      style: BtnStyle(widget.buttonSize),
                      child: const Text('Log in'),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      style: BtnStyle(widget.buttonSize),
                      child: const Text("Sign Up"),
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