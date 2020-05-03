import 'package:flutter/material.dart';

//Models
import '../models/product.dart';

//Screens

//Widgets
import '../widgets/product_item.dart';
import '../widgets/products_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  // Dummy products for testing

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
      ),
      body: ProductsGrid(),
    );
  }
}
