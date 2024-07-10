import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/present_controller.dart';

class PresentView extends GetView<PresentController> {
  const PresentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          log('tap');
          controller.isShow.value = !controller.isShow.value;
        },
        child: SafeArea(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Stack(
              children: [
                // scroll text
                Obx(
                  () => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.sizeOf(context).height * 0.45),
                      child: ListTile(
                        title: Text(
                          controller.content.value,
                          style: TextStyle(fontSize: controller.fontSize.value),
                        ),
                      ),
                    ),
                  ),
                ),

                // toolbar
                Obx(
                  () => Positioned(
                    right: 0.0,
                    bottom: (MediaQuery.sizeOf(context).height * 0.20),
                    width: 48,
                    height: MediaQuery.sizeOf(context).height * 0.40,
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.40,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: controller.isShow.value ? 1.0 : 0.0,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Slider(
                            min: 24.0,
                            max: 100.0,
                            onChanged: (value) {
                              // update font value
                              controller.fontSize.value = value;
                            },
                            value: controller.fontSize.value,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Obx(
                  () => Positioned(
                    left: 0.0,
                    bottom: (MediaQuery.sizeOf(context).height * 0.20),
                    width: 64.0,
                    height: MediaQuery.sizeOf(context).height * 0.40,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: controller.isShow.value ? 1.0 : 0.0,
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Slider(
                          min: 100.0,
                          max: 500.0,
                          onChanged: (value) {
                            // update speed value
                            controller.scrollSpeed.value = value;
                          },
                          value: controller.scrollSpeed.value,
                        ),
                      ),
                    ),
                  ),
                ),

                Obx(
                  () => AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: controller.isShow.value ? 1.0 : 0.0,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: IconButton.filled(
                          onPressed: () {
                            // play
                          },
                          icon: const Icon(
                            Icons.play_arrow,
                            size: 48.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
