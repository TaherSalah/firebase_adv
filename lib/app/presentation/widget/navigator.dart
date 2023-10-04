import 'package:flutter/material.dart';

///////////  Start navigateTo Method /////////////
void navigateTo(BuildContext context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
///////////  End navigateTo Method /////////////

///////////  Start navigate And Finish Method /////////////
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
        (route) =>
    false); //////////////////=> return false or true <==////////////////
///////////  End navigate And Finish Method /////////////