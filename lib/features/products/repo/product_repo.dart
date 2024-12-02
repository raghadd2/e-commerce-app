import 'package:base_project/core/network/end_points.dart';
import 'package:base_project/core/network/remote/dio_client.dart';
import 'package:base_project/features/products/model/product_model.dart';
import 'package:dartz/dartz.dart';

class ProductRepo {
  Future<Either<String, List<ProductModel>>> getProducts() async {
    try {
      final dio = DioClient();
      final response = await dio.get(EndPoints.products).catchError((error) {
        if (error.response != null && error.response.statusCode != 500) {
          throw error.response.data['msg'];
        } else {
          throw "network_error";
        }
      });

      final success =
          (response.data as List).map((e) => ProductModel.fromJson(e)).toList();

      return Right(success);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
