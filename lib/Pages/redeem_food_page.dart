import 'package:flutter/material.dart';
import 'package:debtstiny/Components/product_viewGrid.dart';
import 'package:debtstiny/Components/products.dart';

class RedeemFoodPage extends StatelessWidget {
  const RedeemFoodPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Products> foodItems = [
      Products(
        name: 'Maggi Mee Ayam 77g x 5 Packets',
        coinsNeeded: 30,
        imagePath: 'lib/Images/MaggiAyam.webp',
        isLocked: true,
        milestone: 1,
      ),
      Products(
        name: 'Maggi Mee Kari 77g x 5 Packets',
        coinsNeeded: 30,
        imagePath: 'lib/Images/MaggiKari.webp',
        isLocked: true,
        milestone: 1,
      ),
      Products(
        name: 'Julie’s Golden Crackers 334g',
        coinsNeeded: 20,
        imagePath: 'lib/Images/JulieGold.webp',
        isLocked: true,
        milestone: 1,
      ),
      Products(
        name: 'Julie’s Sugar Crackers 331g',
        coinsNeeded: 20,
        imagePath: 'lib/Images/JulieRed.webp',
        isLocked: true,
        milestone: 1,
      ),
      Products(
        name: 'Ayam Brand Ikan Sardines 425g',
        coinsNeeded: 60,
        imagePath: 'lib/Images/Sardine.webp',
        isLocked: true,
        milestone: 1,
      ),
      Products(
        name: 'Yeo\'s Baked Beans in Tomato Sauce 425g',
        coinsNeeded: 30,
        imagePath: 'lib/Images/Bakedbean.webp',
        isLocked: true,
        milestone: 1,
      ),
      Products(
        name: 'Buruh Cooking Oil 2kg',
        coinsNeeded: 80,
        imagePath: 'lib/Images/oil2kg.webp',
        isLocked: true,
        milestone: 2,
      ),
      Products(
        name: 'Beras Cap Rambutan 5kg',
        coinsNeeded: 120,
        imagePath: 'lib/Images/rice5kg.jpg',
        isLocked: true,
        milestone: 2,
      ),
      Products(
        name: 'Buruh Cooking Oil 5kg',
        coinsNeeded: 180,
        imagePath: 'lib/Images/oil5kg.jpg',
        isLocked: true,
        milestone: 3,
      ),
      Products(
        name: 'Beras Cap Rambutan 5kg',
        coinsNeeded: 200,
        imagePath: 'lib/Images/rice10kg.jpg',
        isLocked: true,
        milestone: 3,
      ),
    ];

    return Scaffold(
      backgroundColor: Color(0xFFF3FCF7),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ProductViewGrid(products: foodItems),
      ),
    );
  }
}
