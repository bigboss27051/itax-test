import 'dart:async';
import 'package:redux/redux.dart';
import '../../models/models.dart';
import '../redux.dart';

class UserViewModel {
  final bool isLoading;
  final User user;
  final Function({Completer completer, String email, String password})
      signInLocal;
  UserViewModel({this.isLoading, this.user, this.signInLocal});

  factory UserViewModel.create(Store<AppState> store) {
    _signInLocal({Completer completer, String email, String password}) {
      store.dispatch(signInLocalAction(
          completer: completer, email: email, password: password));
    }

    

    return UserViewModel(
        isLoading: store.state.authState.isLoading,
        user: store.state.authState.user,
        signInLocal: _signInLocal,);
  }
}
