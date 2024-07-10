import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:teleprompter/app/data/services/prompter_service.dart';
import '../controllers/add_text_controller.dart';

class AddTextView extends GetView<AddTextController> {
  const AddTextView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: controller.titleTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  hintText: 'Title',
                ),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Please enter title';
                  }

                  return null;
                },
              ),
              const Gap(8.0),
              TextFormField(
                controller: controller.contentTextController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  hintText: 'Content',
                ),
                maxLines: null,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Please enter content';
                  }

                  return null;
                },
              ),
              const Gap(4.0),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: FilledButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (controller.formKey.currentState!.validate()) {
                      final title = controller.titleTextController.text.trim();
                      final content =
                          controller.contentTextController.text.trim();

                      // add content
                      await PrompterService().addContent(
                        title: title,
                        content: content,
                      );

                      Get.back();
                    }
                  },
                  child: const Text('Save'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Quis consequat nulla elit cupidatat nulla ut laborum duis excepteur. Aliqua reprehenderit aute enim Lorem ex ullamco elit deserunt. Excepteur labore voluptate velit quis exercitation ad incididunt culpa. Amet do proident magna et esse anim ipsum incididunt aliqua do esse anim.
// Eu cillum ea cupidatat excepteur fugiat. Sit et incididunt adipisicing ut non consectetur proident ex sunt est adipisicing enim. Sit id eu consectetur velit labore adipisicing irure reprehenderit duis adipisicing pariatur et exercitation amet.
