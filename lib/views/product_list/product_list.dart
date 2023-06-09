import 'dart:developer';

import 'package:banana_flutter/data/models/products_response.dart';
import 'package:banana_flutter/data/provider/products_provider.dart';
import 'package:banana_flutter/views/product_list/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await Provider.of<ProductsProvider>(context, listen: false)
            .getProductList();
        if (!mounted) return;
      } catch (e) {
        log(e.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ProductsResponse? productsList =
        Provider.of<ProductsProvider>(context).productList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter challenge 2023"),
        leading: const SizedBox(),
        leadingWidth: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Buscar producto",
                suffixIcon: Icon(Icons.search),
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            if (productsList != null &&
                (productsList.products?.isNotEmpty ?? true)) ...[
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => ListItem(
                  product: productsList.products![index],
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: productsList.products?.length ?? 0,
              )
            ]
          ],
        ),
      ),
    );
  }
}
