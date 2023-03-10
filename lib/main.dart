import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'app/home_page.dart';
//When you create a API key in hgbrasil.com, you should use it URL as I did on the line below
var request = Uri.parse("https://api.hgbrasil.com/finance?key=YOUR-KEY-SHOULD-BE-HERE");

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
