import 'package:flutter/material.dart';
import '../components/products_grid.dart';

class ProductsOverviewPage extends StatefulWidget {
  const ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: FilterOptions.favorites,
                child: Text('Favorites'),
              ),
              PopupMenuItem(
                value: FilterOptions.all,
                child: Text('All'),
              ),
            ],
            onSelected: (FilterOptions value) {
              if (value == FilterOptions.favorites) {
                setState(() {
                  showFavoritesOnly = true;
                });
              } else {
                setState(() {
                  showFavoritesOnly = false;
                });
              }
            },
          ),
        ],
      ),
      body: ProductsGrid(showFavoritesOnly),
    );
  }
}

enum FilterOptions { favorites, all }
