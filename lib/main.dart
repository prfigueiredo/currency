import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'app/home_page.dart';

var request = Uri.parse("https://api.hgbrasil.com/finance?key=f9d6ae28");

void main() async {

  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
      hintColor: Colors.grey,
      primaryColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        hintStyle: TextStyle(color: Colors.grey),
      ),
  )
  ));

  // It's a function that returns JSON data

  Future<Map> getData() async {
    http.Response response = await http.get(request);
    return jsonDecode(response.body);
  }

  print(await getData());

}