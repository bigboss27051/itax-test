import 'dart:async';

import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../../models/models.dart';
import '../../repositories/repositories.dart';

ThunkAction signInLocalAction({
  Completer completer,
  String email,
  String password,
}) {
  return (Store store) async {
    AuthenticationRepository authRepository = new AuthenticationRepository();
    final isAuthticated = await authRepository.loginWithEmailPassword(
        email: email, password: password);
    if (isAuthticated) {
      store.dispatch(new AuthenSuccessAction(User(email: email, id: '1')));
      completer.complete(null);
    } else {
      completer.completeError('Invalid Email or Password.');
      store.dispatch(new FetchAuthFailure());
    }
  };
}

ThunkAction signOutAction(
  Completer completer,
) {
  return (Store store) async {
    try {
      store.dispatch(new StartAuthLoadingAction());
      Future.delayed(Duration(seconds: 2), () async {
        store.dispatch(new SignOutAction());
        completer.complete(null);
      });
    } catch (e) {
      completer.completeError(e.toString());
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
