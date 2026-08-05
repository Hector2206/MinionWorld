import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/favorites_page.dart';
import 'pages/navigation_page.dart';
import 'pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MiniumWorldApp());
}

class MiniumWorldApp extends StatelessWidget {
  const MiniumWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MiniumWorld',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor:  Colors.yellow
      ),

      initialRoute: '/splash',

      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const NavigationPage(),
        '/favorites': (context) => const FavoritesPage(),
        '/splash': (context) => const SplashPage(),
        
      },
    );
  }
}