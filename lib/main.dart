import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/presentation/home/home_screen.dart';
import 'app/presentation/login/login_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final user = FirebaseAuth.instance.currentUser;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print(' ===========================>>>>>User is currently signed out!');
      } else {
        print('===========================>>>>> User is signed in!');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
            return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Pods App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: user == null ? LoginScreen() : HomeScreen(),
    );
  }
}
