import 'dart:async';
import 'package:redux/redux.dart';
import '../../models/models.dart';
import '../redux.dart';

class TodoViewModel {
  final List<Todo> todos;
  final Function(Todo todo) addTodo;
  final Function(int indexTodo) changeStatusTodo;
  final Function(Completer completer) signOut;
  TodoViewModel({this.todos, this.addTodo, this.changeStatusTodo, this.signOut});

  factory TodoViewModel.create(Store<AppState> store) {
    _addTodo(Todo todo) {
      store.dispatch(AddTodoAction(todo));
    }

    _changeStatusTodo(int indexTodo) {
      store.dispatch(ChangeStatusTodoAction(indexTodo));
    }

    _signOut(Completer completer) {
      store.dispatch(signOutAction(completer));
    }

    return TodoViewModel(
        todos: store.state.todoState.todos,
        addTodo: _addTodo,
        changeStatusTodo: _changeStatusTodo,
        signOut: _signOut);
  }
}
