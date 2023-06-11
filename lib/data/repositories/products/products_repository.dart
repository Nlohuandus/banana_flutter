import 'package:banana_flutter/data/models/products_response.dart';
import 'package:banana_flutter/data/models/single_product_response.dart';

abstract class ProductsRepository {
  Future<ProductsResponse> getProducts();
  Future<ProductsResponse> searchProducts(String searchQuery);
  Future<SingleProductResponse> getSingleProduct(int idProduct);
}
