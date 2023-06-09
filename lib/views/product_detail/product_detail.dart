import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation"),
          const Text("precio"),
          const Spacer(),
          ElevatedButton(
              onPressed: () => print("agregar al carrito"),
              child: const Text("agregar al carrito"))
        ],
      ),
    );
  }
}
