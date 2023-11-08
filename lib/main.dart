import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/data/repository/auth_repository.dart';
import 'features/auth/ui/pages/login/bloc/auth_cubit.dart';
import 'features/auth/ui/pages/login/login_page.dart';
import 'features/notes/ui/pages/notes/notes_page.dart';

late final SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  final authRepository = AuthRepositoryImpl();

  runApp(
    BlocProvider(
      create: (context) => AuthCubit(authRepository),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = context.select((AuthCubit cubit) => cubit.state);

    return MaterialApp(
      title: 'Prova Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      // Se o usuário atual estivesse sendo persistido usando SharedPreferences ou outro
      // banco de dados local, aqui poderíamos carregar direto a página de notas.
      home: currentUser == null ? const LoginPage() : const NotesPage(),
    );
  }
}
