import 'package:sli/client.dart';
import 'package:sli/components/choose_one.dart';
import 'package:sli/components/welcome.dart';
import 'package:sli/ui_component.dart';

abstract interface class ComponentBucketContract {
  abstract ClientContract client;

  UiComponent welcome();
  UiComponent chooseOne<T>({required String title, required List<T> choices});
}

final class ComponentBucket implements ComponentBucketContract {
  @override
  late final ClientContract client;

  @override
  Welcome welcome() => Welcome(client);

  @override
  ChooseOne chooseOne<T>({required String title, required List<T> choices}) =>
      ChooseOne<T>(client, title, choices);
}
