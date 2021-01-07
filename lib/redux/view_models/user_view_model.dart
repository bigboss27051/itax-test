import 'dart:async';
import 'package:redux/redux.dart';
import '../../models/models.dart';
import '../redux.dart';

class UserViewModel {
  final bool isLoading;
  final User user;
  final Function({Completer completer, String email, String password})
      signInLocal;
  final Function(Completer completer) signOut;
  UserViewModel({this.isLoading, this.user, this.signInLocal, this.signOut});

  factory UserViewModel.create(Store<AppState> store) {
    _signInLocal({Completer completer, String email, String password}) {
      store.dispatch(signInLocalAction(
          completer: completer, email: email, password: password));
    }

    _signOut(Completer completer) {
      store.dispatch(signOutAction(completer));
    }

    return UserViewModel(
        isLoading: store.state.authState.isLoading,
        user: store.state.authState.user,
        signInLocal: _signInLocal,
        signOut: _signOut);
  }
}
