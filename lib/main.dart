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
      title: "Telepromter",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
