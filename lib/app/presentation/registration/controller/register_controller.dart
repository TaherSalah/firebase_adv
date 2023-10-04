import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../home/home_screen.dart';

class RegisterController extends ControllerMVC {
  factory RegisterController() {
    _this ??= RegisterController._();
    return _this!;
  }

  bool isLoading = false;

  static RegisterController? _this;

  RegisterController._();

  register(BuildContext context,
      {required String email, required String password}) async {
    try {
      setState(() {
        isLoading = true;
      });
      final UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      setState(() {
        isLoading = false;
      });
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Welcom"),
            content:  Text("${credential.user?.email}"),
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
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: use_build_context_synchronously, avoid_print
        print('The password provided is too weak.');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Dialog title"),
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
      } else if (e.code == 'email-already-in-use') {
        // ignore: use_build_context_synchronously

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Dialog title"),
              content: const Text("email-already-in-use"),
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

        showDialog(
          context: context,
          builder: (BuildContext context) {
            setState(() {
              isLoading = false;
            });
            return AlertDialog(
              title: const Text("Dialog title"),
              content: const Text("The account already exists for that email."),
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
        print('The account already exists for that email.');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
