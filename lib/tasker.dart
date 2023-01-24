import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:tasker/operations.dart';

import 'modes.dart';
import 'output.dart';

void startApp() {
  stdin.lineMode = false;

  stdin.listen((event) {
    inputLoop(event);
  });

  ModeController().modeStream.listen((event) {
    stdin.lineMode = event == Mode.insert;
    OutputController().printOutput();
  });

  inputLoop([10]);
}

Future<void> inputLoop(event) async {
  String s = utf8.decode(event);
  s.getOperation().performOperation();
  OutputController().printOutput();
}
