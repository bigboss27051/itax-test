import 'package:meta/meta.dart';

import '../models/models.dart';

class AuthenticationRepository {
  Future<bool> loginWithEmailPassword({
    @required String email,
    @required String password,
  }) async {
    if (email == 'test@mail.com' && password == '123456') {
      await Future.delayed(Duration(seconds: 1));
      return true;
    } else {
      return false;
    }
  }
}
