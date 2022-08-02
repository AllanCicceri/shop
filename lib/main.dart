import 'package:flutter/material.dart';
import 'package:shop/pages/product_details_page.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductsOverviewPage(),
      routes: {
        AppRoutes.productDetails: (context) => const ProductDetailsPage(),
      },
    );
  }
}
