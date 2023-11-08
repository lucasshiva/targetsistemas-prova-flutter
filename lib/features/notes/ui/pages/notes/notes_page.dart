import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/app_gradient_container.dart';
import '../../../../../core/widgets/privacy_policy_text.dart';
import '../../../domain/entity/note_list.dart';
import 'widgets/notes_container.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final FocusNode _focusNode = FocusNode()..requestFocus();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => NoteList()..loadNotes(),
      child: Scaffold(
        body: AppGradientContainer(
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 20),
                    child: NotesContainer(
                      focusNode: _focusNode,
                      controller: _controller,
                    ),
                  ),
                ),
                // Esconde o texto caso o teclado esteja presente na tela.
                Visibility(
                  visible: MediaQuery.viewInsetsOf(context).bottom < 80,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: PrivacyPolicyText(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
