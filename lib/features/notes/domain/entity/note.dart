// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'note.g.dart';

class Note = _NoteBase with _$Note;

abstract class _NoteBase with Store {
  _NoteBase({required this.content});

  @observable
  String content = "";

  @action
  void edit(String newContent) {
    content = newContent;
  }
}
