import 'package:flutter/material.dart';
import 'package:m6_imtihon_bank/pages/create_page.dart';
import 'package:m6_imtihon_bank/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      home: Home_Page(),
      routes: {
        Home_Page.id: (context) => Home_Page(),
        Create_Page.id: (context) => Create_Page(),
      },
    );
  }
}

