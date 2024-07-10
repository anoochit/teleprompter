import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teleprompter/app/data/services/prompter_service.dart';
import 'package:teleprompter/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contents'),
        centerTitle: true,
      ),
      body: Obx(() => RefreshIndicator(
            onRefresh: () async {
              controller.getAllContent();
            },
            child: ListView(
              children: List.generate(controller.listContents.length, (index) {
                final item = controller.listContents[index];
                final title = item.title;
                final content = item.content ?? '';
                final id = item.id;
                return Dismissible(
                  key: Key('$id'),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) async {
                    await PrompterService().deleteContent(id: id);
                  },
                  child: ListTile(
                    onTap: () {
                      // present
                      Get.toNamed(
                        Routes.PRESENT,
                        parameters: {"content": content},
                      );
                    },
                    title: Text(
                      '$title',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: const Icon(Icons.content_paste),
                  ),
                );
              }),
            ),
          )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed(Routes.ADD_TEXT),
        label: const Text('Add content'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
