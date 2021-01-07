import 'dart:async';

import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../../models/models.dart';
import '../../repositories/repositories.dart';

ThunkAction signUpLocalAction({
  Completer completer,
  String email,
  String password,
}) {
  return (Store store) async {
    try {
      AuthenticationRepository authRepository = new AuthenticationRepository();
      final user = await authRepository.loginWithEmailPassword(
          email: email, password: password);
      store.dispatch(new AuthenSuccessAction(user));
      completer.complete(null);
    } catch (e) {
      completer
          .completeError(e.response.data['error'] ?? e.response.statusMessage);
      store.dispatch(new FetchAuthFailure());
    }
  };
}

class FetchAuthFailure {
  FetchAuthFailure();
}

class StartAuthLoadingAction {
  StartAuthLoadingAction();
}

class StopAuthLoadingAction {
  StopAuthLoadingAction();
}

class AuthenSuccessAction {
  final User user;
  AuthenSuccessAction(this.user);
}

class SignOutAction {
  SignOutAction();
}
