import 'package:flutter/material.dart';
import 'package:debtstiny/Components/products.dart';
import 'package:debtstiny/Components/product_item_widget.dart';

class ProductViewGrid extends StatelessWidget {
  final List<Products> products; // Change the type to List<Products>

  const ProductViewGrid({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.75, // Aspect ratio of each grid item
      ),
      itemBuilder: (context, index) {
        return ProductItemWidget(product: products[index]); // Display each product item
      },
    );
  }
}
