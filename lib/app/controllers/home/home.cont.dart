import 'package:get/get.dart';

import '../../../routes/routings.dart';
import '../../models/pokemons.model.dart';
import '../../services/database/database.service.dart';
import '../details/details.cont.dart';

class HomeController extends GetxController {
  final dbs = Get.find<DatabaseService>();
  final DetailsController detailsCont = Get.find();

  RxList<MPokemon> pokemonList = <MPokemon>[].obs;
  RxBool onLoadPokemon = false.obs;

  @override
  void onInit() {
    super.onInit();
    getPokemons();
  }

  void getPokemons() {
    dbs.getPokemonsData().then((pokemons) {
      if (pokemons != null) {
        pokemonList.addAll(pokemons);
        onLoadPokemon.value = true;
      } else {
        onLoadPokemon.value = true;
      }
    });
  }

  void clickAction(MPokemon selectedItem) {
    detailsCont.selectedPokoman.value = MPokemon();
    detailsCont.selectedPokoman.value = selectedItem;
    if (detailsCont.selectedPokoman.value.id != null) {
      Get.toNamed(RouteManager.delails);
    }
  }
}
