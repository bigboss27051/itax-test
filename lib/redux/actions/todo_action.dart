import 'package:itax_test/models/models.dart';

class AddTodoAction {
  final Todo todo;

  AddTodoAction(this.todo);
}

class ChangeStatusTodoAction {
  final int indexTodo;
  ChangeStatusTodoAction(this.indexTodo);
}
