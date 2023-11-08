import '../entity/user.dart';

/// Essa interface é apenas um contrato que outras classes devem implementar.
abstract interface class AuthRepository {
  /// Faz a autenticação do usuário. Retorna [True] se as informações estiverem corretas.
  /// Caso o contrário, retorna [False].
  bool login({required String username, required String password});

  /// Retorna uma [Stream] do tipo [User]. Desta forma, qualquer parte da aplicação pode
  /// consumir essa stream para seus casos de uso.
  Stream<User?> get userStream;
}
