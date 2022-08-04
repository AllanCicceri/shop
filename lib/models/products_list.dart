import 'package:flutter/widgets.dart';
import 'package:shop/data/dummy_products.dart';
import 'package:shop/models/product.dart';

class ProductsList with ChangeNotifier {
  final List<Product> _productsList = dummyProducts;

  List<Product> get getProductsList => [..._productsList];

  addProduct(Product product) {
    _productsList.add(product);
    notifyListeners();
  }
}
