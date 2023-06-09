import 'package:banana_flutter/data/models/products_response.dart';
import 'package:banana_flutter/data/repositories/products/products_repository_impl.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  ProductsResponse? _productList;

  ProductsResponse? get productList => _productList;

  void setProductList(ProductsResponse newProductList) {
    _productList = newProductList;
    notifyListeners();
  }

  getProductList() async {
    setProductList(
      await ProductsRepositoryImpl().getProducts(),
    );
  }
}
