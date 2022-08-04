import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product_item.dart';

import '../models/product.dart';
import '../models/products_list.dart';

class ProductsGrid extends StatelessWidget {
  final bool _showFavoritesOnly;

  const ProductsGrid(
    this._showFavoritesOnly, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsList>(context);

    List<Product> productsLoaded = provider.getProductsList;
    if (_showFavoritesOnly) {
      productsLoaded =
          productsLoaded.where((element) => element.isFavorite).toList();
    }

    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: productsLoaded.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: ((context, index) {
          return ChangeNotifierProvider.value(
              value: productsLoaded[index], child: const ProductItem());
        }));
  }
}
