import 'package:banana_flutter/core/dio/dio_client.dart';
import 'package:banana_flutter/data/models/products_response.dart';
import 'package:banana_flutter/data/repositories/products/products_repository.dart';
import 'package:dio/dio.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  @override
  Future<ProductsResponse> getProducts() async {
    try {
      final response = await DioClient.dio.get("/products");

      if (response.statusCode == 200) {
        return ProductsResponse.fromJson(response.data);
      } else {
        throw Exception("No se Obtener la lista de productos");
      }
    } on DioException catch (e) {
      final errorMessage = e.message.toString();
      throw errorMessage;
    }
  }
}
