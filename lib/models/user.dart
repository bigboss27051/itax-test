import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  const User({
    @required this.email,
    @required this.id,
  })  : assert(email != null),
        assert(id != null);

  final String email;
  final String id;
  static const empty = User(email: '', id: '');

  @override
  List<Object> get props => [email, id];
}
