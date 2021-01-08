import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../models/models.dart';

class TodoState extends Equatable {
  final List<Todo> todos;

  TodoState({this.todos});

  factory TodoState.initial() {
    return new TodoState(
      todos: List<Todo>(),
    );
  }

  TodoState copyWith({
    List<Todo> todos,
  }) {
    return new TodoState(todos: todos ?? this.todos);
  }

  @override
  List<Object> get props => [
        todos,
      ];

  static TodoState fromJson(dynamic json) {
    return TodoState(
      todos: (jsonDecode(json['todos']) as List).map((i) => Todo.fromJson(i)).toList(),
    );
  }

  dynamic toJson() {
    return {'todos': jsonEncode(todos.map((e) => e.toJson()).toList())};
  }
}
