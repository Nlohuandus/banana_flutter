import 'package:banana_flutter/data/models/single_product_response.dart';
import 'package:banana_flutter/data/provider/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  static final currencyFormat = NumberFormat.simpleCurrency(
    locale: "en_US",
    decimalDigits: 2,
  );
  @override
  Widget build(BuildContext context) {
    SingleProductResponse? product =
        context.read<ProductsProvider>().singleProduct;
    return Scaffold(
      appBar: AppBar(
        title: Text("${product?.title}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: product?.images?.length ?? 0,
                itemBuilder: (context, index) {
                  return Image.network(
                    "${product?.images![index]}",
                  );
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "${product?.description}",
            ),
            const SizedBox(
              height: 64,
            ),
            Text(
              "USD ${currencyFormat.format(product?.price)}",
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 48,
              child: ElevatedButton(
                onPressed: () => print("Agregar al carrito"),
                child: const Text("Agregar al carrito"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
