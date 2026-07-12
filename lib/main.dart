import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/Bindings/initialBinding.dart';
import 'package:testproject/routes.dart'; // Add this import if routes are defined in routes.dart
import 'package:testproject/core/localization/changelocal.dart';
import 'package:testproject/core/localization/translation.dart';
import 'package:testproject/core/services/serveses.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialServices();
  await Get.putAsync<Myservices>(() async => await Myservices().init());

  //Get.put(FavoriteController());
  //Get.put(crud());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your1 application.+
  @override
  Widget build(BuildContext context) {
    localController controllerlang = Get.put(localController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controllerlang.languege,
      theme: controllerlang.Apptheme,

      initialBinding: initialBinding(),

      // theme:
      // home: testview(),
      //routes: routes,.3
      getPages: routes,
    );
  }
}
