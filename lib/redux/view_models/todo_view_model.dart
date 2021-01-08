import 'dart:async';
import 'package:redux/redux.dart';
import '../../models/models.dart';
import '../redux.dart';

class TodoViewModel {
  final List<Todo> todos;
  final Function(Todo todo) addTodo;
  final Function(int indexTodo) changeStatusTodo;
  TodoViewModel({this.todos, this.addTodo, this.changeStatusTodo});

  factory TodoViewModel.create(Store<AppState> store) {
    _addTodo(Todo todo) {
      store.dispatch(AddTodoAction(todo));
    }

    _changeStatusTodo(int indexTodo) {
      store.dispatch(ChangeStatusTodoAction(indexTodo));
    }

    return TodoViewModel(
        todos: store.state.todoState.todos,
        addTodo: _addTodo,
        changeStatusTodo: _changeStatusTodo);
  }
}
