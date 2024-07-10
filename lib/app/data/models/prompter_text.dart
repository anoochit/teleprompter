import 'package:isar/isar.dart';

part 'prompter_text.g.dart';

@collection
class PrompterText {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  @Index(type: IndexType.value)
  String? title;

  @Index(type: IndexType.value)
  String? content;

  @enumerated
  Status status = Status.draft;
}

enum Status {
  draft,
  publish,
}
