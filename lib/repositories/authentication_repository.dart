import 'package:meta/meta.dart';

import '../models/models.dart';

class AuthenticationRepository {
  Future<User> loginWithEmailPassword({
    @required String email,
    @required String password,
  }) async {
    if (email == 'test@mail.com' && password == '123456') {
      await Future.delayed(Duration(seconds: 1));
      return User(email: 'test@gmail.com', id: '1');
    } else {
      throw new Error();
    }
  }
}
