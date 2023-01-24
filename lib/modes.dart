import 'dart:async';

enum Mode {
  selection,
  insert,
}

class ModeController {
  factory ModeController() => _instance;
  static final ModeController _instance = ModeController._();
  ModeController._();

  final StreamController<Mode> _modeC = StreamController<Mode>.broadcast();
  Stream<Mode> get modeStream => _modeC.stream;
  StreamSink<Mode> get _modeSink => _modeC.sink;
  Mode current = Mode.selection;

  changeMode(Mode mode) async {
    if (mode == current) return;
    current = mode;
    _modeSink.add(mode);
  }
}
