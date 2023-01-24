import 'dart:io';

import 'output.dart';
import 'modes.dart';
import 'all_items.dart';

enum Operation {
  modeChangeInsert,
  modeChangeSelection,
  keyUP,
  keyDOWN,
  keyRIGHT,
  keyLEFT,
  select,
  delete,
  insert,
  quit,
  unknown,
}

extension OperationExt on Operation {
  performOperation() {
    switch (this) {

////////////////////////////////////////////////////////////////////////////////////////////////////
      ///
      /// Key Press Operations
      ///
      case Operation.keyUP:
        OutputController().pointerUp;
        break;
      case Operation.keyDOWN:
        OutputController().pointerDown;
        break;
      case Operation.select:
        OutputController().selectItem;
        break;
      case Operation.keyRIGHT:
        // TODO: add operation to perform here
        break;
      case Operation.keyLEFT:
        // TODO: add operation to perform here
        break;
      case Operation.delete:
        OutputController().pointer = 0;
        OutputController().fullOutput.deleteItems();
        break;
      case Operation.insert:
        OutputController().fullOutput.add(OutputController().itemEntry);
        ModeController().changeMode(Mode.selection);
        break;
      case Operation.quit:
        print("Quitting Application");
        exit(0);

////////////////////////////////////////////////////////////////////////////////////////////////////
      ///
      /// Mode Change Operations
      ///
      case Operation.modeChangeInsert:
        ModeController().changeMode(Mode.insert);
        break;
      case Operation.modeChangeSelection:
        ModeController().changeMode(Mode.selection);
        break;

////////////////////////////////////////////////////////////////////////////////////////////////////
      ///
      /// Unidentified Operation
      ///
      case Operation.unknown:
        // TODO: add operation to perform here
        break;
    }
  }
}

extension StringExt on String {
  Operation getOperation() {
    if (length > 1 && ModeController().current == Mode.insert) {
      OutputController().itemEntry = this;
      return Operation.insert;
    }
    switch (this) {
      case "i":
        return Operation.modeChangeInsert;
      case "s":
        return Operation.modeChangeSelection;
      case "k":
        return Operation.keyUP;
      case "j":
        return Operation.keyDOWN;
      case "l":
        return Operation.keyRIGHT;
      case "h":
        return Operation.keyLEFT;
      case "o":
        return Operation.select;
      case "d":
        return Operation.delete;
      // case "":
      //   return Operation.insert;
      case "q":
        return Operation.quit;
    }
    return Operation.unknown;
  }
}
