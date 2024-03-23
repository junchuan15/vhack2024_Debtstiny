import 'package:flutter/material.dart';
import 'package:debtstiny/Components/products.dart';
import 'package:debtstiny/Components/product_item_widget.dart';

class ProductViewGrid extends StatelessWidget {
  final List<Products> products;

  const ProductViewGrid({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(8.0),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 6,
              childAspectRatio: 0.67,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ProductItemWidget(product: products[index]);
              },
              childCount: products.length,
            ),
          ),
        ),
      ],
    );
  }
}
