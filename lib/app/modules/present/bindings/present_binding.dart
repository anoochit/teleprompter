import 'package:get/get.dart';

import '../controllers/present_controller.dart';

class PresentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PresentController>(
      () => PresentController(),
    );
  }
}
