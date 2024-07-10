import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_text_controller.dart';

class AddTextView extends GetView<AddTextController> {
  const AddTextView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddTextView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddTextView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
