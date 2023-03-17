import 'package:flutter/material.dart';

//Presenter (MVP pattern)
class Presenter{
  // input user text controllers
  final reaisController = TextEditingController();
  final dolaresController = TextEditingController();
  final eurosController = TextEditingController();

  late double dolares;
  late double euros;
  late double reais;

  //It's a function that calculates quotation, using the text typed by user.
  void reaisChanged(String text){
    double reais = double.parse(text);
    dolaresController.text = (reais/dolares).toStringAsFixed(2);
    eurosController.text = (reais/euros).toStringAsFixed(2);
  }
  //It's a function that calculates quotation, using the text typed by user.
  void dolaresChanged(String text){
    double dolares = double.parse(text);
    reaisController.text = (dolares * this.dolares).toStringAsFixed(2);
    eurosController.text = (dolares * euros/euros).toStringAsFixed(2);
  }
  // It's a function that calculates quotation, using the text typed by user.
  void eurosChanged(String text){
    double euros = double.parse(text);
    reaisController.text = (euros * this.euros).toStringAsFixed(2);
    dolaresController.text = (euros * this.euros/dolares).toStringAsFixed(2);
  }

  //A method that erases field information
  resetButton(){
    reaisController.clear();
    dolaresController.clear();
    eurosController.clear();
  }

}