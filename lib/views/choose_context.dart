import 'package:sli/view.dart';

final class ChooseContext extends ViewContract {
  ChooseContext(super.client) {
    clearScreen();

    client.components.welcome();
    selectContext();
    selectBucket();
  }

  void selectContext() {
    final context = client.components.chooseOne(
      title: 'Select a context',
      choices: client.environments.contexts
          .map((context) => context.name)
          .toList(),
    );

    final value = client.environments.contexts
        .where((element) => element.name == context.value)
        .firstOrNull;

    if (value == null) {
      client.logger.err('No context found in the selected environment');
      return;
    }

    client.environments.currentContext = value;
  }

  void selectBucket() {
    final bucket = client.components.chooseOne(
      title: 'Select a bucket',
      choices: client.environments.currentContext!.buckets,
    );

    final value = client.environments.currentContext!.buckets
        .where((element) => element == bucket.value)
        .firstOrNull;

    if (value == null) {
      client.logger.err('No bucket found in the available buckets');
      return;
    }

    client.environments.currentBucket = value;
  }
}
