import 'package:conv/app/Model/model_page.dart';
import 'package:conv/app/Presenter/presenter_page.dart';
import 'package:flutter/material.dart';

//View (MVP pattern)
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Instancing Model class (MVP pattern)
  Model textData = Model();
  //Instancing Presenter class (MVP pattern)
  Presenter controller = Presenter();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Currency Converter"),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => setState(() {
                    controller.resetButton();
                  }),
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: FutureBuilder<Map>(
          future: textData.getData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: Text(
                    "Loading...",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25.0,
                    ),
                  ),
                );
              default:
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      "Ocorreu um erro no carregamento dos dados",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 25.0,
                      ),
                    ),
                  );
                } else {
                  controller.dolares =
                      snapshot.data!["results"]["currencies"]["USD"]["buy"];
                  controller.euros =
                      snapshot.data!["results"]["currencies"]["EUR"]["buy"];

                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Icon(
                          Icons.monetization_on,
                          size: 150.0,
                          color: Colors.green,
                        ),
                        buildTextField(
                            "BRL",
                            "R\$ ",
                            controller.reaisController,
                            controller.reaisChanged),
                        const Divider(),
                        buildTextField(
                            "USD",
                            "US\$ ",
                            controller.dolaresController,
                            controller.dolaresChanged),
                        const Divider(),
                        buildTextField("EUR", "€ ", controller.eurosController,
                            controller.eurosChanged),
                      ],
                    ),
                  );
                }
            }
          }),
    );
  }
}

Widget buildTextField(String label, String prefix,
    TextEditingController controller, final function) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.grey),
      border: const OutlineInputBorder(),
      prefixText: prefix,
    ),
    style: const TextStyle(
      color: Colors.grey,
      fontSize: 25.0,
    ),
    onChanged: function,
    keyboardType: TextInputType.number,
  );
}
