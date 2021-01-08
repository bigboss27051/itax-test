import 'package:equatable/equatable.dart';

import '../../models/models.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final User user;
  final bool isLogged;

  AuthState({this.user, this.isLoading, this.isLogged});

  factory AuthState.initial() {
    return new AuthState(
      isLoading: false,
      user: User(),
      isLogged: false,
    );
  }

  AuthState copyWith({
    bool isLoading,
    User user,
    bool isLogged,
  }) {
    return new AuthState(
      isLogged: isLogged ?? this.isLogged,
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        isLogged,
        user,
      ];

  static AuthState fromJson(dynamic json) => AuthState(
        isLoading: json["isLoading"],
        isLogged: json['isLogged'],
        user: User.fromJson(json['user']),
      );

  dynamic toJson() => {
        "isLoading": isLoading,
        'isLogged': isLogged,
        'user': user.toJson(),
      };
}
