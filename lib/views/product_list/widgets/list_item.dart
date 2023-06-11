import 'package:banana_flutter/data/models/products_response.dart';
import 'package:banana_flutter/data/provider/products_provider.dart';
import 'package:banana_flutter/views/product_detail/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.product,
  });

  final Products product;
  static final currencyFormat = NumberFormat.simpleCurrency(
    locale: "en_US",
    decimalDigits: 2,
  );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context.read<ProductsProvider>().getSingleProduct(product.id!);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ProductDetail(),
          ),
        );
      },
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${product.title}"),
                      Text("${product.brand}"),
                    ],
                  ),
                  Text("USD ${currencyFormat.format(product.price)}"),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                "${product.description}",
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                "Cant. ${product.stock}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
