import 'package:banana_flutter/core/routes/routes.dart';
import 'package:banana_flutter/core/themes/main_theme.dart';
import 'package:banana_flutter/views/login/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter challenge 2023',
      theme: MainTheme.lightTheme,
      routes: routes,
      home: const LoginPage(),
    );
  }
}
