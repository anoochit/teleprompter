import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PresentController extends GetxController {
  //
  RxString content = ''.obs;
  RxDouble fontSize = 48.0.obs;
  RxDouble scrollSpeed = 10.0.obs;
  RxBool isShow = true.obs;
  ScrollController scrollController = ScrollController();
  RxBool isPlay = false.obs;
  RxBool isFlip = true.obs;

  @override
  void onInit() {
    super.onInit();
    setContentData();
  }

  void setContentData() {
    content.value = Get.parameters['content'] ?? '';
  }

  void autoScroll() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: Duration(seconds: scrollSpeed.value.ceil()),
      curve: Curves.linear,
    );
  }

  void stopScroll() {
    scrollController.animateTo(scrollController.position.minScrollExtent,
        duration: Duration.zero, curve: Curves.linear);
  }

  void setSpeed({required double speed}) {
    scrollSpeed.value = speed;
  }

  void play() {
    toggleTool();
    autoScroll();
  }

  void flip() {
    isFlip.value = !isFlip.value;
  }

  void setFontSize({required double size}) {
    fontSize.value = size;
  }

  void toggleTool() {
    isShow.value = !isShow.value;
  }
}
