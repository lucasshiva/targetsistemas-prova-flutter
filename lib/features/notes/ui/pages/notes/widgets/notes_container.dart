import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/note_list.dart';
import 'note_card.dart';
import 'note_text_field.dart';

class NotesContainer extends StatelessWidget {
  const NotesContainer({
    super.key,
    this.focusNode,
    this.controller,
  });

  final FocusNode? focusNode;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final store = RepositoryProvider.of<NoteList>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        NoteCard(controller: controller, focusNode: focusNode),
        NoteTextField(
          focusNode: focusNode,
          controller: controller,
          onSubmitted: (value) {
            if (controller == null || controller!.text.isEmpty) {
              focusNode?.requestFocus();
              return;
            }

            if (store.noteToEdit != null) {
              store.editNote(store.noteToEdit!, controller!.text);
            } else {
              store.addNote(controller!.text);
            }
            controller!.clear();
            focusNode?.requestFocus();
          },
        ),
      ],
    );
  }
}
