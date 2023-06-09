import 'package:banana_flutter/data/models/products_response.dart';

abstract class ProductsRepository {
  Future<ProductsResponse> getProducts();
}
