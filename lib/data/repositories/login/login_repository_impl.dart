import 'package:banana_flutter/core/dio/dio_client.dart';
import 'package:banana_flutter/data/models/login_request.dart';
import 'package:banana_flutter/data/models/user_data.dart';
import 'package:banana_flutter/data/repositories/login/login_repository.dart';
import 'package:dio/dio.dart';

class LoginRepositoryImpl extends LoginRepository {
  @override
  Future<UserData> auth(LoginRequest json) async {
    try {
      final response =
          await DioClient.dio.post("/auth/login", data: json.toJson());

      if (response.statusCode == 200) {
        return UserData.fromJson(response.data);
      } else {
        throw Exception("No se pudo iniciar sesion");
      }
    } on DioException catch (e) {
      final errorMessage = e.message.toString();
      throw errorMessage;
    }
  }
}
