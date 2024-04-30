import 'package:ricky_morty_api/DATA/model/character.dart';
import 'package:ricky_morty_api/DATA/service/web_server.dart';

//Here we need to get the data as the way we want as List<Character> from the Web Services
//creat a new class
class CharacterRepesitory {
  final CharaterApi charaterApi;

  CharacterRepesitory({required this.charaterApi});

// for better use the same function name;

  Future<List<Character>> getAllData() async {
    final character = await charaterApi.getAllData();

    return character.map((e) => Character.mapfrom(e)).toList();
  }

  void fetchData() {
    charaterApi.fetchData();
  }
}
