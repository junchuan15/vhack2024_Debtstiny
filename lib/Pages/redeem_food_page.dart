import 'package:flutter/material.dart';
import 'package:debtstiny/Components/product_viewGrid.dart'; 
import 'package:debtstiny/Components/products.dart';

class RedeemFoodPage extends StatelessWidget {
  const RedeemFoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Products> foodItems = [
      Products(name: 'Maggi Mee Ayam 77g x 5 Packets', coinsNeeded: 80, imagePath: 'lib/Images/MaggiAyam.webp'),
      Products(name: 'Maggi Mee Kari 77g x 5 Packets', coinsNeeded: 80, imagePath: 'lib/Images/MaggiKari.webp'),
    ];

    return Scaffold(
      backgroundColor: Color(0xFFD3F4E3), 
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ProductViewGrid(products: foodItems), 
      ),
    );
  }
}
