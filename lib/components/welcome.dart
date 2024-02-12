import 'package:io/ansi.dart';
import 'package:sli/client.dart';
import 'package:sli/ui_component.dart';

final class Welcome extends UiComponent {
  final ClientContract _client;

  Welcome(this._client) {
    // final width = stdout.terminalColumns < 60
    //     ? stdout.terminalColumns
    //     : 60;

    // _client.logger.writeln('┌${'-' * (width - 2)}┐');
    _client.logger.info('Welcome to SLI');
    _client.logger.writeln(null);

    if (_client.environments.currentContext?.name != null) {
      final context = styleDim.wrap(lightCyan.wrap(_client.environments.currentContext?.name));
      _client.logger.writeln('Context : $context');
    }

    if (_client.environments.currentBucket != null) {
      final context = styleDim.wrap(lightCyan.wrap(_client.environments.currentBucket));
      _client.logger.writeln('Bucket : $context');
      _client.logger.writeln(null);
    }

    // _client.logger.writeln('└${'-' * (width - 2)}┘');
  }
}
