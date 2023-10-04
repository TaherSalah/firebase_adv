import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class RegisterController extends ControllerMVC {
  factory RegisterController() {
    _this ??= RegisterController._();
    return _this!;
  }

  bool isLoading = false;

  static RegisterController? _this;

  RegisterController._();


}
