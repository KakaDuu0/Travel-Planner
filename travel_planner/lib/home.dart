import 'package:flutter/material.dart';
import 'service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.service});

  final Service service;

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black,
                  ),
                  height: 400,
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: ListView(
                    children: [
                      OutlinedButton(
                          onPressed: () {}, child: const Text('salut'))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
