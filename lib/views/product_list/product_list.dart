import 'dart:developer';

import 'package:banana_flutter/data/provider/session_provider.dart';
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
  Widget build(BuildContext context) {
    log(Provider.of<SessionProvider>(context).user?.toJson().toString() ??
        "null");
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
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => const ListItem(),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: 5,
            )
          ],
        ),
      ),
    );
  }
}
