import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  const User({
    @required this.email,
    @required this.id,
    this.password,
  })  : assert(email != null),
        assert(id != null);

  final String email;
  final String id;
  final String password;
  static const empty = User(email: '', id: '', password: '');

  @override
  List<Object> get props => [email, id, password];
}