import 'package:itax_test/redux/actions/action.dart';
import 'package:itax_test/redux/state/state.dart';
import 'package:redux/redux.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, FetchAuthFailure>(_fetchFailed),
  TypedReducer<AuthState, StartAuthLoadingAction>(_startLoading),
  TypedReducer<AuthState, AuthenSuccessAction>(_authenSuccess),
]);

AuthState _startLoading(AuthState state, StartAuthLoadingAction action) {
  return state.copyWith(
    isLoading: true,
  );
}

AuthState _fetchFailed(AuthState state, FetchAuthFailure action) {
  return state.copyWith(
    isLoading: false,
  );
}

AuthState _authenSuccess(AuthState state, AuthenSuccessAction action) {
  return state.copyWith(isLoading: false, user: action.user, isLogged: true);
}
