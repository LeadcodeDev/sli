import 'dart:io';

import 'package:path/path.dart';
import 'package:sli/environment.dart';
import 'package:yaml/yaml.dart';

final class EnvironmentBucket {
  final List<EnvironmentContract> contexts = [];

  EnvironmentContract? currentContext;
  String? currentBucket;

  EnvironmentBucket() {
    final file = File(join(Directory.current.path, 'config.yaml'));
    final content = file.readAsStringSync();

    final yaml = loadYaml(content);
    for (final environment in yaml['contexts']) {
      contexts.add(Environment.fromDisk(environment));
    }
  }
}
