import 'package:isar/isar.dart';
import 'package:teleprompter/app/data/models/prompter_text.dart';

import '../../isar.dart';

class PrompterService {
  // add content
  addContent({required String title, required String content}) async {
    final row = PrompterText()
      ..title = title
      ..content = content;
    isar.writeTxn(() async {
      return await isar.prompterTexts.put(row);
    }).catchError((e) async {
      throw ('$e');
    });
  }

  // get all contents
  Future<List<PrompterText>> getContents() async {
    return await isar.prompterTexts.where().findAll();
  }

  // get content by id
  Future<PrompterText?> getContent({required int id}) async {
    return await isar.prompterTexts.get(id);
  }

  // delete
  deleteContent({required int id}) async {
    isar.writeTxn(() async {
      await isar.prompterTexts.delete(id);
    });
  }

  Stream<List<PrompterText>> getStreamContent() {
    return isar.prompterTexts.where().watch();
  }
}
