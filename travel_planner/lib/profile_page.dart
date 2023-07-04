import 'package:flutter/material.dart';
import 'service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.service});

  final Service service;

  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  String currentPage = 'Profile';
  String pageToRight = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Profile'),
    );
  }
}
