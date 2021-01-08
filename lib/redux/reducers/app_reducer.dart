import 'package:itax_test/redux/actions/action.dart';
import 'package:itax_test/redux/state/state.dart';

import 'auth_reducer.dart';
import 'todo_reducer.dart';

AppState appReducer(AppState state, action) {
  if (action is SignOutAction) {
    return AppState(
        todoState: TodoState.initial(), authState: AuthState.initial());
  }
  return AppState(
    authState: authReducer(state.authState, action),
    todoState: todoReducer(state.todoState, action),
  );
}
