import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("object"),
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
                    children: const [
                      Text("IPHONE 9"),
                      Text("Apple"),
                    ],
                  ),
                  const Text("USD549.00"),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation"),
              const SizedBox(
                height: 32,
              ),
              const Text("Stock Numero")
            ],
          ),
        ),
      ),
    );
  }
}
