import 'package:flutter/material.dart';
import 'service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.service});

  final Service service;

  @override
  State<StatefulWidget> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  String currentPage = 'Settings';
  String pageToLeft = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('settings'),
    );
  }
}
