import 'dart:io';

import 'package:sli/io/control_character.dart';
import 'package:sli/io/readable_key.dart';

final class KeyStroke {
  final String char;
  final ControlCharacter controlChar;

  const KeyStroke({
    this.char = '',
    this.controlChar = ControlCharacter.unknown,
  });

  static readKey() => ReadableKey();

  factory KeyStroke.char(String char) {
    assert(char.length == 1, 'characters must be a single unit');
    return KeyStroke(
      char: char,
      controlChar: ControlCharacter.none,
    );
  }

  factory KeyStroke.control(ControlCharacter controlChar) {
    return KeyStroke(controlChar: controlChar);
  }
}
