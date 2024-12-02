import 'package:base_project/core/network/local/shared_pref.dart';
import 'package:base_project/core/network/local/shared_pref_key.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  DioClient._internal();
  static final DioClient _instance = DioClient._internal();
  static DioClient get instance => _instance;
  Dio dio = Dio();
  DioClient() {
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          String token = SharedPref.getData(SharedPrefKeys.token) ?? "";
          options.headers['Authorization'] = 'Bearer $token';
          options.headers['Accept'] = '*/*';
          options.headers['Content-Type'] = 'application/json';
          return handler.next(options);
        },
      ),
    );

    dio.options.headers['Accept'] = '*/*';
  }

  setOptions(BaseOptions options) {
    dio.options = options;
  }

  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters, Options? options}) async {
    return await dio.get(url,
        queryParameters: queryParameters, options: options);
  }

  Future<Response> post(String url,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      dynamic data}) async {
    return await dio.post(url,
        queryParameters: queryParameters, options: options, data: data);
  }

  Future<Response> put(String url,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      dynamic data}) async {
    return await dio.put(url,
        queryParameters: queryParameters, options: options, data: data);
  }

  Future<Response> delete(String url,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      dynamic data}) async {
    return await dio.delete(url,
        queryParameters: queryParameters, options: options, data: data);
  }
}
