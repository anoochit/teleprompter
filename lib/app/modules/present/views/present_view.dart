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
          controller.toggleTool();
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
                    controller: controller.scrollController,
                    reverse: (controller.isFlip.value),
                    child: Container(
                      padding: EdgeInsets.only(
                        top: (controller.isFlip.value)
                            ? 0.0
                            : (MediaQuery.sizeOf(context).height * 0.45),
                        bottom: (controller.isFlip.value)
                            ? (MediaQuery.sizeOf(context).height * 0.45)
                            : 0.0,
                      ),
                      child: ListTile(
                        title: Transform.flip(
                          flipX: (controller.isFlip.value) ? false : false,
                          flipY: (controller.isFlip.value) ? true : false,
                          child: Text(
                            controller.content.value,
                            style:
                                TextStyle(fontSize: controller.fontSize.value),
                            textAlign: TextAlign.center,
                          ),
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
                    width: 64.0,
                    height: MediaQuery.sizeOf(context).height * 0.50,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: controller.isShow.value ? 1.0 : 0.0,
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Slider(
                          min: 24.0,
                          max: 100.0,
                          divisions: 20,
                          onChanged: (value) {
                            // update font value
                            controller.setFontSize(size: value);
                          },
                          value: controller.fontSize.value,
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
                    height: MediaQuery.sizeOf(context).height * 0.50,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: controller.isShow.value ? 1.0 : 0.0,
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Slider(
                          min: 1.0,
                          max: 120.0,
                          divisions: 20,
                          onChanged: (value) {
                            // update speed value
                            controller.setSpeed(speed: value);
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
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // play
                            IconButton.filled(
                              onPressed: () {
                                // play
                                controller.play();
                              },
                              icon: const Icon(
                                Icons.play_arrow_outlined,
                                size: 48.0,
                              ),
                            ),
                            // flip
                            IconButton.filledTonal(
                              onPressed: () {
                                // flip
                                controller.flip();
                              },
                              icon: const Icon(Icons.flip),
                            )
                          ],
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
