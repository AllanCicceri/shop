import 'package:flutter/material.dart';
import 'package:shop/data/dummy_products.dart';

import '../components/product_item.dart';

class ProductsOverviewPage extends StatelessWidget {
  final productsLoaded = dummyProducts;

  ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shop')),
      body: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: productsLoaded.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: ((context, index) {
            return ProductItem(productsLoaded[index]);
          })),
    );
  }
}
