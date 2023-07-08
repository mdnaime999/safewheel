import 'package:get/get.dart';

import '../app/services/database/database.service.dart';

class DatabaseConfig {
  Future<void> openServices() async {
    await Get.putAsync(() => DatabaseService().init());
  }
}
