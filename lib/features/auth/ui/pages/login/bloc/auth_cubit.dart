import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entity/user.dart';
import '../../../../domain/repository/auth_repository.dart';

class AuthCubit extends Cubit<User?> {
  final AuthRepository _authRepository;
  late final StreamSubscription _streamSubscription;

  // Emite um novo estado sempre que o valor da stream muda.
  AuthCubit(this._authRepository) : super(null) {
    _streamSubscription = _authRepository.userStream.listen((user) {
      emit(user);
    });
  }

  bool login(String username, String password) {
    return _authRepository.login(username: username, password: password);
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
