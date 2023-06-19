import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled22/QuizApp/Bottom.dart';
import 'package:untitled22/QuizApp/Homepage.dart';
import 'package:untitled22/QuizApp/LoginPage.dart';
import 'package:untitled22/QuizApp/Profile.dart';
import 'package:untitled22/QuizApp/Questions.dart';
import 'package:untitled22/QuizApp/Pages.dart';
import 'package:untitled22/QuizApp/Splashscreen.dart';

import 'QuizApp/SignupPage.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/signup': (context) => Signup(),
        '/homepage': (context) => Home(),
        '/profile': (context) => Profile(),
      },
    );
  }
}
