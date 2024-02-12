import 'package:io/ansi.dart';
import 'package:sli/client.dart';
import 'package:sli/component_bucket.dart';
import 'package:sli/environment_bucket.dart';
import 'package:sli/logger/logger.dart';
import 'package:sli/storage_client.dart';
import 'package:sli/view_bucket.dart';

final class Sli {
  late final ClientContract client;

  Sli() {
    final storage = ClientStorage();
    final logger = Logger(
      theme: LogTheme(
        info: (String? message) => lightBlue.wrap(message),
      ),
    );
    final components = ComponentBucket();
    final environments = EnvironmentBucket();
    final views = ViewBucket();

    client = Client(storage, logger, components, environments, views);
    client
      ..logger.client = client
      ..components.client = client
      ..views.client = client;
  }

  Future<void> run () async {
    client.logger.clearComponentScreen();

    client.views.chooseContext();
    client.views.listObject();
  }
}
