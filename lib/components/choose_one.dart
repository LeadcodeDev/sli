import 'dart:io';

import 'package:io/ansi.dart';
import 'package:sli/client.dart';
import 'package:sli/io/control_character.dart';
import 'package:sli/io/key_stroke.dart';
import 'package:sli/ui_component.dart';

final class ChooseOne<T> extends UiComponent {
  final ClientContract _client;

  final String message;
  final List<T> choices;
  T? value;

  ChooseOne(this._client, this.message, this.choices, {T? defaultValue}) {
    int index = defaultValue != null ? choices.indexOf(defaultValue) : 0;

    stdin
      ..echoMode = false
      ..lineMode = false;

    writeChoices(index);

    while (value == null) {
      final key = KeyStroke.readKey.parse();
      final isArrowUpOrKKey = key.controlChar == ControlCharacter.arrowUp || key.char == 'k';
      final isArrowDownOrJKey = key.controlChar == ControlCharacter.arrowDown || key.char == 'j';
      final isReturnOrEnterOrSpaceKey = key.controlChar == ControlCharacter.ctrlJ ||
          key.controlChar == ControlCharacter.ctrlM ||
          key.char == ' ';

      if (isArrowUpOrKKey) {
        index = (index - 1) % (choices.length);
      } else if (isArrowDownOrJKey) {
        index = (index + 1) % (choices.length);
      } else if (isReturnOrEnterOrSpaceKey) {
        stdin
          ..lineMode = true
          ..echoMode = true;

        final displayResult = display(choices[index]);
        final coloredResult = styleDim.wrap(lightCyan.wrap(displayResult));
        stdout
          ..write('\x1b8')
          ..write('\x1b[J')
          ..write('\x1b[?25h')
          ..write('$message ')
          ..writeln(coloredResult);

        value = choices[index];
        break;
      }

      stdout.write('\x1b8');
      writeChoices(index);
    }
  }

  String display(T message) => '$message';

  void writeChoices(int index) {
    stdout
      // save cursor
      ..write('\x1b7')
      // hide cursor
      ..write('\x1b[?25l')
      ..writeln(message);

    for (final choice in choices) {
      final isCurrent = choices.indexOf(choice) == index;

      if (isCurrent) {
        stdout
          ..write(green.wrap('❯'))
          ..write(' ${lightCyan.wrap(display(choice))}');
      } else {
        stdout
          ..write(' ')
          ..write(' ${display(choice)}');
      }
      if (choices.last != choice) {
        stdout.write('\n');
      }
    }
  }
}
