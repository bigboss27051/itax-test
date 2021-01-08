import 'package:redux/redux.dart';
import '../state/todo_state.dart';
import '../actions/todo_action.dart';

final todoReducer = combineReducers<TodoState>([
  TypedReducer<TodoState, AddTodoAction>(_addTodo),
  TypedReducer<TodoState, ChangeStatusTodoAction>(_changeStatusTodo),
]);

TodoState _addTodo(TodoState state, AddTodoAction action) {
  state.todos.add(action.todo);
  return state.copyWith(
    todos: state.todos.reversed.toList(),
  );
}

TodoState _changeStatusTodo(TodoState state, ChangeStatusTodoAction action) {
  state.todos[action.indexTodo].isCompleted =
      !state.todos[action.indexTodo].isCompleted;
  return state.copyWith(
    todos: state.todos,
  );
}
