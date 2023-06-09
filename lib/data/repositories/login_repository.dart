import 'package:banana_flutter/data/models/login_request.dart';
import 'package:banana_flutter/data/models/user_data.dart';

abstract class LoginRepository {
  Future<UserData> auth(LoginRequest json);
}
