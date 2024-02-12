import 'package:sli/client.dart';

abstract class ViewContract {
  final ClientContract client;

  ViewContract(this.client);

  void clearScreen() {
    client.logger.write('\x1b[0;0H');
    client.logger.write('\x1b[2J');
  }
}
