import 'package:banana_flutter/data/models/products_response.dart';
import 'package:banana_flutter/data/models/single_product_response.dart';
import 'package:banana_flutter/data/repositories/products/products_repository_impl.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  ProductsResponse? _productList;
  SingleProductResponse? _singleProduct;

  SingleProductResponse? get singleProduct => _singleProduct;
  ProductsResponse? get productList => _productList;

  void setProductList(ProductsResponse newProductList) {
    _productList = newProductList;
    notifyListeners();
  }

  void setSingleProduct(SingleProductResponse newSingleProduct) {
    _singleProduct = newSingleProduct;
    notifyListeners();
  }

  void clearSingleProduct() {
    _singleProduct = null;
    notifyListeners();
  }

  getProductList() async {
    setProductList(
      await ProductsRepositoryImpl().getProducts(),
    );
  }

  searchProductList(String searchQuery) async {
    setProductList(
      await ProductsRepositoryImpl().searchProducts(searchQuery),
    );
  }

  getSingleProduct(int idProduct) async {
    setSingleProduct(
      await ProductsRepositoryImpl().getSingleProduct(idProduct),
    );
  }
}
