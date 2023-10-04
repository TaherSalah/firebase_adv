import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../../home/home_screen.dart';






class LoginController extends ControllerMVC {
  factory LoginController() {
    _this ??= LoginController._();
    return _this!;
  }

  bool isLoading = false;

  static LoginController? _this;

  LoginController._();




  final userCredential = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  login(BuildContext context,
      {required String email, required String password}) async {
    try {
      setState(() {
        isLoading = true;
      });
  final user=await  FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);



      setState(() {
        isLoading = false;
      });
        // ignore: use_build_context_synchronously

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Welcom back !"),
            content:  Text("${user.user?.email}"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Okay"))
            ],
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'user-not-found') {
        // ignore: use_build_context_synchronously
        (
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Auth Error"),
              content: const Text("No user found for that email"),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Okay"))
              ],
            );
          },
        );
        // ignore: avoid_print
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // ignore: use_build_context_synchronously
        (
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Auth error"),
              content: const Text("Wrong password provided for that user."),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Okay"))
              ],
            );
          },
        );
        // ignore: avoid_print
        print('Wrong password provided for that user.');
      }
    }
  }

  signInAnonymously(BuildContext context) async {
    try {
      setState(() {
        isLoading = true;
      });

      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Dialog title"),
            content: const Text("Signed in with temporary account."),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Okay"))
            ],
          );
        },
      );
      // ignore: avoid_print
      print("Signed in with temporary account.");
      setState(() {
        isLoading = false;
      });
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          // ignore: avoid_print
          print("Anonymous auth hasn't been enabled for this project.");
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Dialog title"),
                content: const Text(
                    "Anonymous auth hasn't been enabled for this project."),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Okay"))
                ],
              );
            },
          );
          break;
        default:
          // ignore: avoid_print
          print("Unknown error.");
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Dialog title"),
                content: const Text("Unknown error."),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Okay"))
                ],
              );
            },
          );
      }
    }
  }
  bool isActive = true;
  GlobalKey<FormState> formKey = GlobalKey();


  void togglePassword() {
    isActive = !isActive;
    setState(() {});
  }
}
