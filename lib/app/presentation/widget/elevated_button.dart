import 'package:flutter/material.dart';

Widget elevatedButton(
    {MaterialStateProperty? backgroundColor, required String text,}) {
  return ElevatedButton(
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.deepPurple),
          elevation: MaterialStatePropertyAll(10),
          textStyle: MaterialStatePropertyAll(
              TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 20, vertical: 40))),
      onPressed: () async {},
      child: Text(text));
}
