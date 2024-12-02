import 'package:base_project/core/network/end_points.dart';
import 'package:base_project/core/network/local/shared_pref.dart';
import 'package:base_project/core/network/local/shared_pref_key.dart';
import 'package:base_project/core/network/remote/dio_client.dart';
import 'package:base_project/features/auth/repositry/auth_repositry/otp_params.dart';
import 'package:base_project/features/auth/repositry/auth_repositry/product_params.dart';
import 'package:dartz/dartz.dart';

class AuthenticationRepositry {
  Future<Either<String, void>> login(LoginParmas params) async {
    try {
      var dio = DioClient();
      final response = await dio
          .post(EndPoints.signin, queryParameters: params.tojsin())
          .catchError((error) {
        if (error.response != null && error.response.statusCode != 500) {
          throw error.response.data['message'];
        } else {
          throw "network_error";
        }
      });
      // var sucess = LoginModel.fromJson(response.data['data']);

      return Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, void>> checkOtp(OtpParmas params) async {
    try {
      var dio = DioClient();
      final response = await dio
          .post(EndPoints.checkotp, queryParameters: params.tojsin())
          .catchError((error) {
        if (error.response != null && error.response.statusCode != 500) {
          throw error.response.data['message'];
        } else {
          throw "network_error";
        }
      });
      // var sucess = OtpModel.fromJson(response.data['data']);
      await SharedPref.setData(
          key: SharedPrefKeys.token, value: response.data['token']);

      return Right(null);
    } catch (e) {
      return Left(e.toString());
    }
    

  }
}
