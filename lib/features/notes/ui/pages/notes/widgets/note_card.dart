import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../domain/entity/note_list.dart';
import 'note_separator.dart';
import 'note_tile.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    this.controller,
    this.focusNode,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;
    final store = RepositoryProvider.of<NoteList>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: screenSize.width * 0.75,
          maxHeight: screenSize.height * 0.6,
        ),
        child: Card(
          color: Colors.white,
          child: Observer(builder: (context) {
            if (store.notes.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "A lista está vazia. Digite algo para começar.",
                    style: textTheme.bodyLarge?.copyWith(color: Colors.black),
                  ),
                ),
              );
            }

            return ListView.separated(
              itemBuilder: (context, index) {
                final note = store.notes.elementAt(index);
                return NoteTile(
                  note: note,
                  noteIndex: index,
                  controller: controller,
                  focusNode: focusNode,
                );
              },
              separatorBuilder: (context, index) {
                return const NoteSeparator();
              },
              itemCount: store.notes.length,
            );
          }),
        ),
      ),
    );
  }
}
