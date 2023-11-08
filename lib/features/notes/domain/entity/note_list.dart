// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:prova_flutter/main.dart';

import 'note.dart';

part 'note_list.g.dart';

class NoteList = _NoteList with _$NoteList;

abstract class _NoteList with Store {
  _NoteList();

  static const notesKey = "notes";

  void loadNotes() {
    final savedContents = prefs.getStringList(notesKey) ?? [];
    if (savedContents.isEmpty) return;

    final savedNotes = savedContents.map((content) => Note(content: content));
    notes.addAll(savedNotes);
  }

  @observable
  ObservableList<Note> notes = ObservableList<Note>();

  @observable
  Note? noteToEdit;

  @action
  void addNote(String content) {
    final note = Note(content: content);
    notes.add(note);
    saveNotes();
  }

  @action
  void editNote(Note note, String newContent) {
    final updatedNote = note..edit(newContent);
    final updatedNotes = <Note>[
      for (final n in notes)
        if (n == note) updatedNote else n
    ];

    notes = updatedNotes.asObservable();
    noteToEdit = null;
    saveNotes();
  }

  @action
  void deleteNote(int index) {
    notes.removeAt(index);
    saveNotes();
  }

  Future<void> saveNotes() async {
    prefs.setStringList(notesKey, notes.map((note) => note.content).toList());
  }
}
