import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/routes/app_routes.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  _navigateToProductItem(context, product) {
    Navigator.of(context).pushNamed(
      AppRoutes.productDetails,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Consumer<Product>(
            builder: (context, product, _) => IconButton(
              onPressed: () => product.toggleFavorite(),
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
            ),
          ),
          title: Text(
            product.name,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ),
        child: GestureDetector(
            onTap: () => _navigateToProductItem(context, product),
            child: Image.network(product.imageUrl, fit: BoxFit.cover)),
      ),
    );
  }
}
