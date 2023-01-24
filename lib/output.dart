import 'dart:io';
import 'all_items.dart';
import 'modes.dart';

void clrscr() => stdout.write(Process.runSync("clear", []).stdout);

class OutputController {
  factory OutputController() => _instance;
  static final OutputController _instance = OutputController._();
  OutputController._();

  String itemEntry = "";
  String header = "";
  AllItems fullOutput = AllItems([]);
  String display = "";
  String footer = "";

  int pointer = 0;

  get pointerUp {
    pointer > 0 ? pointer-- : null;
    setPointer;
  }

  get pointerDown {
    pointer < fullOutput.length - 1 ? pointer++ : null;
    setPointer;
  }

  get setPointer => fullOutput.cursorPosition(pointer);

  get selectItem => fullOutput.selectItem(pointer);

  printOutput() {
    display = "";
    for (var e in fullOutput.allItems) {
      display = "$display$e";
    }
    clrscr();
    print(ModeController().current.name.toUpperCase());
    print("");
    if (ModeController().current == Mode.selection) {
      print(display);
      print(pointer);
    } else if (ModeController().current == Mode.insert) {
      print(display);
      print(pointer);
      stdout.write("Add Item >>> ");
    }
  }
}
