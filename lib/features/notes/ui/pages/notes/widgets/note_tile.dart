import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../domain/entity/note.dart';
import '../../../../domain/entity/note_list.dart';
import 'delete_note_button.dart';
import 'edit_note_button.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({
    super.key,
    required this.note,
    required this.noteIndex,
    this.controller,
    this.focusNode,
  });

  final Note note;
  final int noteIndex;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final store = RepositoryProvider.of<NoteList>(context);

    return Observer(builder: (context) {
      return ListTile(
        textColor: Colors.black,
        title: Text(note.content, textAlign: TextAlign.center, maxLines: 3),
        selected: note == store.noteToEdit,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            EditNoteButton(
              isActive: note == store.noteToEdit,
              onPressed: () {
                final shouldEdit = store.noteToEdit != note;
                if (shouldEdit) {
                  store.noteToEdit = note;
                  controller?.text = note.content;
                  focusNode?.requestFocus();
                } else {
                  store.noteToEdit = null;
                  controller?.text = "";
                }
              },
            ),
            DeleteNoteButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Deletar nota?"),
                      content: const Text("Tem certeza que deseja deletar esta nota?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancelar"),
                        ),
                        TextButton(
                          onPressed: () {
                            store.deleteNote(noteIndex);
                            if (store.noteToEdit == note) {
                              controller?.text = "";
                              store.noteToEdit = null;
                            }
                            Navigator.pop(context);
                          },
                          child: const Text("Deletar"),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      );
    });
  }
}
