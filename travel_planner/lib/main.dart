import 'package:travel_planner/service.dart';

import 'starter_page.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'home_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static Service s = const Service();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black87,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => StarterPage(s: s),
        '/login': (context) => LoginPage(service: s),
        '/register': (context) => RegisterPage(service: s),
        '/home': (context) => MainHomePage(service: s),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
