import 'dart:convert';
import 'package:http/http.dart' as http;
//You should create a KEY on the HG Brasil Finance API that contains the URL requested(http request)!
var request = Uri.parse("https://api.hgbrasil.com/finance?key=YOUR-API-KEY");

//Model (MVP pattern)
class Model{
// It's a function that returns JSON data
Future<Map> getData() async {
  http.Response response = await http.get(request);
  return jsonDecode(response.body);
}
}
