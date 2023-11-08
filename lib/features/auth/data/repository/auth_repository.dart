import 'dart:async';

import '../../domain/entity/user.dart';
import '../../domain/repository/auth_repository.dart';

final class AuthRepositoryImpl implements AuthRepository {
  static const String correctUsername = "targetsistemas";
  static const String correctPassword = "123456789";

  // O valor inicial da stream é null, já que nenhum usuário está autenticado.
  final StreamController<User?> _streamController = StreamController()..add(null);

  @override
  Stream<User?> get userStream => _streamController.stream;

  @override
  bool login({required String username, required String password}) {
    final accountExists = (username == correctUsername) && (password == correctPassword);
    if (!accountExists) return false;

    final user = User(username: username, password: password);
    _streamController.sink.add(user);
    return true;
  }
}
