import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/present_controller.dart';

class PresentView extends GetView<PresentController> {
  const PresentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PresentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PresentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
