import 'package:flutter/material.dart';
import 'service.dart';
import 'models/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.service});

  final Service service;

  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  bool switchState = false;
  User user = User('alonzo', 'uaoa@gag.co');

  void updateSetting(String key, var value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 90,
            ),
            Column(
              children: List.generate(
                user.getSettings().length,
                (index) => user.getSettings()[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
