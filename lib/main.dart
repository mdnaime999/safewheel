import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'init/database_config.dart';
import 'routes/bindings.dart';
import 'routes/routings.dart';

void main() async {
  await DatabaseConfig().openServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        RouteManager().jointRoute();
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Safe Wheel',
          locale: Locale('en', 'US'),
          fallbackLocale: Locale('en', 'US'),
          initialBinding: HomeBindings(),
          initialRoute: RouteManager.home,
          getPages: RouteManager.routes,
          theme: ThemeData(primarySwatch: Colors.red),
          navigatorObservers: [
            FlutterSmartDialog.observer
          ],
          builder: FlutterSmartDialog.init(),
        );
      },
    );
  }
}
