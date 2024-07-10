import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teleprompter/app/isar.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  // init widget
  WidgetsFlutterBinding.ensureInitialized();

  await initIsarDatabase();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Telepromter",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
    ),
  );
}
