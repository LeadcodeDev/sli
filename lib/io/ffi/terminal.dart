import 'dart:io';

import 'package:sli/io/ffi/unix_terminal.dart';
import 'package:sli/io/ffi/windows_terminal.dart';

abstract class Terminal {
  factory Terminal() => Platform.isWindows ? WindowsTerminal() : UnixTerminal();

  void enableRawMode();
  void disableRawMode();
}
