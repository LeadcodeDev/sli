import 'package:sli/client.dart';
import 'package:sli/view.dart';
import 'package:sli/views/choose_context.dart';
import 'package:sli/views/list_object.dart';

final class ViewBucket {
  late final ClientContract client;

  ViewContract chooseContext() => ChooseContext(client);
  ViewContract listObject() => ListObject(client);
}
