import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PresentController extends GetxController {
  //
  RxString content = ''.obs;
  RxDouble fontSize = 48.0.obs;
  RxDouble scrollSpeed = 100.0.obs;

  RxBool isPlay = false.obs;
  RxBool isShow = true.obs;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();

    setContentData();
  }

  void setContentData() {
    content.value = Get.parameters['content'] ?? '';
  }
}
