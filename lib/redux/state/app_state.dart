import 'package:equatable/equatable.dart';

import 'auth_state.dart';
// import 'todo_state.dart';

class AppState extends Equatable {
  final AuthState authState;
  // final TodoState todoState;

  AppState({
    // this.todoState,
    this.authState,
  });

  factory AppState.initial() {
    return AppState(
      authState: AuthState.initial(),
      // todoState: TodoState.initial(),
    );
  }

  AppState copyWith({
    AuthState authState,
    // TodoState todoState,
  }) {
    return AppState(
      authState: authState ?? this.authState,
      // todoState: todoState ?? this.todoState
    );
  }

  @override
  List<Object> get props => [
        authState,
        // todoState
      ];

  static AppState fromJson(dynamic json) => AppState(
        authState: (json != null && json["authState"] != null)
            ? AuthState.fromJson(json["authState"])
            : AuthState.initial(),
        // todoState: (json != null && json["todoState"] != null)
        //     ? todoState.fromJson(json["todoState"])
        //     : todoState.initial(),
      );

  dynamic toJson() {
    return {
      'authState': authState.toJson(),
      // 'todoState': todoState.toJson(),
    };
  }
}
