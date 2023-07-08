// ignore_for_file: unused_import

import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as dev;

import '../../../init/contractors.dart';
import '../../../views/widgets/snackbar.dart';
import '../../models/pokemons.model.dart';

class DatabaseService extends GetxService {
  Future<DatabaseService> init() async => this;
  static var client = http.Client();

  // ======================================================= Pokemons Get Data
  Future<List<MPokemon>?> getPokemonsData() async {
    Uri uri = InitVariable().apiUri(InitVariable().pokemons);
    var response = await client.get(uri);
    print(response.statusCode);
    // dev.log(response.body);
    if (response.statusCode == 200) {
      var pokemonsFromJson = jsonDecode(response.body)['data']['pokemons'];
      return mPokemonFromJson(jsonEncode(pokemonsFromJson));
    } else {
      print(response.statusCode);
      ShowSnackbar.show("Warning!", "${jsonDecode(response.body)['message']}", "warning");
      return null;
    }
  }
}
