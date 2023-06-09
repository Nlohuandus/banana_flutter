import 'package:banana_flutter/data/models/login_request.dart';
import 'package:banana_flutter/data/models/user_data.dart';
import 'package:banana_flutter/data/repositories/login_repository_impl.dart';
import 'package:flutter/material.dart';

class SessionProvider extends ChangeNotifier {
  UserData? _user;

  UserData? get user => _user;

  void setUser(UserData newUser) {
    _user = newUser;
    notifyListeners();
  }

  auth({
    required String user,
    required String password,
  }) async {
    setUser(
      await LoginRepositoryImpl().auth(
        LoginRequest(
          password: password,
          username: user,
        ),
      ),
    );
  }
}
