import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'data/models/prompter_text.dart';

late Isar isar;

initIsarDatabase() async {
  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open(
    [PrompterTextSchema],
    directory: dir.path,
  );
}
