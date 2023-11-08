// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteList on _NoteList, Store {
  late final _$notesAtom = Atom(name: '_NoteList.notes', context: context);

  @override
  ObservableList<Note> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableList<Note> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$noteToEditAtom =
      Atom(name: '_NoteList.noteToEdit', context: context);

  @override
  Note? get noteToEdit {
    _$noteToEditAtom.reportRead();
    return super.noteToEdit;
  }

  @override
  set noteToEdit(Note? value) {
    _$noteToEditAtom.reportWrite(value, super.noteToEdit, () {
      super.noteToEdit = value;
    });
  }

  late final _$_NoteListActionController =
      ActionController(name: '_NoteList', context: context);

  @override
  void addNote(String content) {
    final _$actionInfo =
        _$_NoteListActionController.startAction(name: '_NoteList.addNote');
    try {
      return super.addNote(content);
    } finally {
      _$_NoteListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editNote(Note note, String newContent) {
    final _$actionInfo =
        _$_NoteListActionController.startAction(name: '_NoteList.editNote');
    try {
      return super.editNote(note, newContent);
    } finally {
      _$_NoteListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteNote(int index) {
    final _$actionInfo =
        _$_NoteListActionController.startAction(name: '_NoteList.deleteNote');
    try {
      return super.deleteNote(index);
    } finally {
      _$_NoteListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notes: ${notes},
noteToEdit: ${noteToEdit}
    ''';
  }
}
