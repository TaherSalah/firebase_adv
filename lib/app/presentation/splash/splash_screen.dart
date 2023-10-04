import 'dart:async';

import 'package:flutter/material.dart';

import '../on_boarding/on_boarding_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnBoardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
           const     SizedBox(height: 40,),
                Image.asset(
                  'assets/images/micLogo.png',
                  height: 300.0,
                  width: 300.0,
                ),
              ],
            ),
            const Text(
              'Welcome Back !',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const CircularProgressIndicator(),
            const SizedBox(height: 30,),

          ],
        ),
      ),
    );
  }
}
