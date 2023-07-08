import 'package:get/get.dart';

import '../app/controllers/details/details.cont.dart';
import '../app/controllers/home/home.cont.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

class DetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() => DetailsController());
  }
}
