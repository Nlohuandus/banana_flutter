import 'package:banana_flutter/views/login/login_page.dart';
import 'package:banana_flutter/views/product_detail/product_detail.dart';
import 'package:banana_flutter/views/product_list/product_list.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  'login': (context) => const LoginPage(),
  'product_list': (context) => const ProductList(),
  'product_detail': (context) => const ProductDetail(),
};
