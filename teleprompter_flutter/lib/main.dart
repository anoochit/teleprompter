import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teleprompter_flutter/serverpod.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initializeServerpodClient();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
