class AllItems {
  List<Item> allItems;
  AllItems(this.allItems) {
    cursorPosition(0);
  }
}

class Item {
  bool activeSelection;
  bool cursor;
  String data;
  Item({
    required this.activeSelection,
    required this.cursor,
    required this.data,
  });

  @override
  String toString() {
    return "${cursor ? ">" : " "} ${activeSelection ? "#" : " "} $data";
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////
///
/// AllItems utility functions for ease of use
///
////////////////////////////////////////////////////////////////////////////////////////////////////
extension AllItemsExt on AllItems {
  deleteItems() {
    if (allItems.any((element) => element.activeSelection)) {
      allItems.removeWhere((e) => e.activeSelection);
    } else {
      allItems.removeWhere((element) => element.cursor);
    }
    cursorPosition(0);
  }

  int get length => allItems.length;
  add(String data) {
    allItems.add(Item(activeSelection: false, cursor: false, data: data));
    cursorPosition(0);
  }

  addAll(Iterable<String> items) {
    allItems.addAll(
        items.map((e) => Item(activeSelection: false, cursor: false, data: e)));
    cursorPosition(0);
  }

  bool isInRange(int i) => i < allItems.length;

  cursorPosition(int i) {
    for (var e in allItems) {
      e.cursor = false;
    }
    if (isInRange(i)) allItems[i].cursor = true;
  }

  selectItem(int i) {
    if (isInRange(i)) {
      allItems[i].activeSelection = !allItems[i].activeSelection;
    }
  }
}
