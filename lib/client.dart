import 'package:sli/component_bucket.dart';
import 'package:sli/environment_bucket.dart';
import 'package:sli/logger/logger.dart';
import 'package:sli/storage_client.dart';
import 'package:sli/view_bucket.dart';

abstract interface class ClientContract {
  ClientStorageContract get storage;
  LoggerContract get logger;
  ComponentBucket get components;
  EnvironmentBucket get environments;
  ViewBucket get views;
}

final class Client implements ClientContract {
  @override
  final ClientStorageContract storage;

  @override
  final LoggerContract logger;

  @override
  final ComponentBucket components;

  @override
  final EnvironmentBucket environments;

  @override
  final ViewBucket views;

  Client(this.storage, this.logger, this.components, this.environments, this.views);
}
