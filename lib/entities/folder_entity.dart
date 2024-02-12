import 'package:sli/entities/file_entity.dart';
import 'package:sli/entity.dart';

final class FolderEntity implements EntityContract {
  @override
  final String key;

  final Map<String, FileEntity> files;

  FolderEntity(this.key, this.files);
}
