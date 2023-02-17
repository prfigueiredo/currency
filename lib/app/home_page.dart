import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

//You should create a key file("key.dart") apart that contains the URL requested(http request)
// In this code I call it as "request"(Line 50).
import 'key.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // input user text controllers
  final reaisController = TextEditingController();
  final dolaresController = TextEditingController();
  final eurosController = TextEditingController();

  late double dolares;
  late double euros;
  late double reais;

  //It's a function that calculates quotation, using the text typed by user.
  void _reaisChanged(String text){
    double reais = double.parse(text);
    dolaresController.text = (reais/dolares).toStringAsFixed(2);
    eurosController.text = (reais/euros).toStringAsFixed(2);
  }
  //It's a function that calculates quotation, using the text typed by user.
  void _dolaresChanged(String text){
    double dolares = double.parse(text);
    reaisController.text = (dolares * this.dolares).toStringAsFixed(2);
    eurosController.text = (dolares * euros/euros).toStringAsFixed(2);
  }
  // It's a function that calculates quotation, using the text typed by user.
  void _eurosChanged(String text){
    double euros = double.parse(text);
    reaisController.text = (euros * this.euros).toStringAsFixed(2);
    dolaresController.text = (euros * this.euros/dolares).toStringAsFixed(2);
  }

  // It's a function that returns JSON data
  Future<Map> getData() async {
    http.Response response = await http.get(request);
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Currency Converter"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
            switch(snapshot.connectionState){
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: Text(
                    "Carregando...",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25.0,
                    ),
                  ),

                );
              default:
                if(snapshot.hasError){
                  return Center(
                    child: Text(
                      "Ocorreu um erro no carregamento dos dados",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 25.0,
                      ),
                    ),
                  );
                }else{

                  dolares = snapshot.data!["results"]["currencies"]["USD"]["buy"];
                  euros = snapshot.data!["results"]["currencies"]["EUR"]["buy"];


                  return SingleChildScrollView(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(
                            Icons.monetization_on,
                            size: 150.0,
                            color: Colors.green,
                        ),
                        buildTextField("BRL", "R\$ ", reaisController, _reaisChanged),
                        Divider(),
                        buildTextField("USD", "US\$ ", dolaresController, _dolaresChanged),
                        Divider(),
                        buildTextField("EUR", "€ ", eurosController, _eurosChanged),
                      ],
                    ),
                  );
                }
            }
        }
      ),
    );
  }
}

Widget buildTextField(String label, String prefix, TextEditingController controller,final function){

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(),
        prefixText: prefix,
      ),
      style: TextStyle(
        color: Colors.grey,
        fontSize: 25.0,
      ),
      onChanged: function,
      keyboardType: TextInputType.number,
    );


}