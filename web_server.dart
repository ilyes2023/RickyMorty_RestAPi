import 'dart:convert';

import 'package:http/http.dart' as http;

// this is the start of our fetching  Process
class CharaterApi {
// Feetch data Function from the web
  Future<List<dynamic>> getAllData() async {
    //using Http Package
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));

    final data = json.decode(response.body);
    return data['results'];
  }

  // next step is moving the the repesitory

  void fetchData() async {
    final response = await http
        .get(Uri.parse('https://rickandmortyapi.com/api/character/?page=20'));

    final data = json.decode(response.body);
    print(data);
  }
}
