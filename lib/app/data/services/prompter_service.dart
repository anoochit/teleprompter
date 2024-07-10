import 'package:isar/isar.dart';
import 'package:teleprompter/app/data/models/prompter_text.dart';

import '../../isar.dart';

class PrompterService {
  // add content
  Future<int> addContent(
      {required String title, required String content}) async {
    final row = PrompterText()
      ..title = title
      ..content = content;
    return await isar.prompterTexts.put(row);
  }

  // get all contents
  Future<List<PrompterText>> getContents() async {
    return await isar.prompterTexts.where().findAll();
  }

  // get content by id
  Future<PrompterText?> getContent({required int id}) async {
    return await isar.prompterTexts.get(id);
  }
}
