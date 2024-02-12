import 'package:sli/entity.dart';

final class FileEntity implements EntityContract {
  @override
  final String key;

  final dynamic object;

  const FileEntity(this.key, this.object);
}
