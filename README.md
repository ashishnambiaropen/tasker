## Tasker[defunct]
Simple CLI Modal Task Manager.
Implementation is unproper, requires significant refactor.
#### Issues: 
- Modal implementation requires different operations depending on mode. Currently insert mode is insignificant.
- Listening to mode changes is unnecessary.
- 99% operations need to be synchronous. Asynchronous operations can cause problems when changing state of the output.
- Current implementation hard-codes the mode change which does not easily allow for adding other features like sub-menus and pages.
- items global and local position for cursor if categories need to be added.
Overall: the implementation is only a start for a modal task manager, but has lot of problems. Personaly, I think it requires a major refactor to make it work.

---

### Usage:
#### Via Dart Compiler
To run via the dart compiler, run: `dart run`
#### Via Executable
To run the executable: `{workspace}/bin/tasker.exe`
To recompile run: `dart compile exe {workspace}/bin/tasker.dart`, then run the previous command to run the compiled `tasker.exe`

---

#### Instructions:
###### In Selection Mode:
- `i` to enter insert mode, then enter a string to add to list and automatically return to selection mode.
- `j` & `k` for moving cursor.
- `o` to select item.
- `d` to delete selected items.
- `d` to delete item on cursor if no items selected.

---

### functionality:
- [x] Modal task manager
- [x] select multiple and delete
- [x] delete under cursor if not selected
- [ ] reorder items
- [ ] local storage
- [ ] categories
- [ ] pages
- [ ] submenus