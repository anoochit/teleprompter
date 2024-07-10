import 'package:get/get.dart';

import '../modules/add_text/bindings/add_text_binding.dart';
import '../modules/add_text/views/add_text_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/present/bindings/present_binding.dart';
import '../modules/present/views/present_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_TEXT,
      page: () => const AddTextView(),
      binding: AddTextBinding(),
    ),
    GetPage(
      name: _Paths.PRESENT,
      page: () => const PresentView(),
      binding: PresentBinding(),
    ),
  ];
}
