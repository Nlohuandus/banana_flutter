import 'package:banana_flutter/core/routes/routes.dart';
import 'package:banana_flutter/core/themes/main_theme.dart';
import 'package:banana_flutter/data/provider/session_provider.dart';
import 'package:banana_flutter/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SessionProvider>(
          create: (_) => SessionProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
      home: const LoaderOverlay(child: LoginPage()),
    );
  }
}
