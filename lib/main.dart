import 'package:flutter/material.dart';
import 'package:spotify_clone_flutter/core/config/theme/app_theme.dart';
import 'package:spotify_clone_flutter/presentation/splash/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Clone',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: SplashScreen(), 
    );
  }
}

