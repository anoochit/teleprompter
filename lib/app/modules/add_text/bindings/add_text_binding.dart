import 'package:get/get.dart';

import '../controllers/add_text_controller.dart';

class AddTextBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTextController>(
      () => AddTextController(),
    );
  }
}
