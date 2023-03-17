import 'package:flutter/material.dart';
import 'app/View/home_page.dart';

void main() async {
  runApp(MaterialApp(
      home: Home(),
      theme: ThemeData(
        hintColor: Colors.grey,
        primaryColor: Colors.white,
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          hintStyle: TextStyle(color: Colors.grey),
        ),
      )
  ));
}