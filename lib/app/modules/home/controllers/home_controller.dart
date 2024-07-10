import 'package:get/get.dart';
import 'package:teleprompter/app/data/models/prompter_text.dart';
import 'package:teleprompter/app/data/services/prompter_service.dart';

class HomeController extends GetxController {
  RxList<PrompterText> listContents = <PrompterText>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllContent();
    openStream();
  }

  openStream() {
    final stream = PrompterService().getStreamContent();
    stream.listen((data) {
      listContents.value = data;
    });
  }

  Future<void> getAllContent() async {
    final contents = await PrompterService().getContents();
    listContents.value = contents;
  }
}
