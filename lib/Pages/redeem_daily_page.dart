
import 'package:flutter/material.dart';
import 'package:debtstiny/Components/product_viewGrid.dart';
import 'package:debtstiny/Components/products.dart';

class RedeemDailyPage extends StatelessWidget {
  const RedeemDailyPage({Key? key, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Products> dailyItems = [
      Products(
        name: 'Colgate Regular Fluoride Toothpaste',
        coinsNeeded: 30,
        imagePath: 'lib/Images/toothpaste.jpg',
        isLocked: true,
        milestone: 1,
      ),
      Products(
        name: 'Colgate ZigZag Toothbursh 5s (Soft)',
        coinsNeeded: 50,
        imagePath: 'lib/Images/toothbrush.jpg',
        isLocked: true,
        milestone: 1,
      ),
      Products(
        name: 'SAFI Antibacterial Shower Cream 2L',
        coinsNeeded: 70,
        imagePath: 'lib/Images/showergel.png',
        isLocked: true,
        milestone: 1,
      ),
      Products(
        name: 'Sunlight Dish Washing Liquid 800mL',
        coinsNeeded: 30,
        imagePath: 'lib/Images/dish.jpg',
        isLocked: true,
        milestone: 1,
      ),
      Products(
        name: 'Libresse Maxi Wings 24cm (3x16s)',
        coinsNeeded: 80,
        imagePath: 'lib/Images/pad.jpg',
        isLocked: true,
        milestone: 1,
      ),
      Products(
        name: 'SAFI Shayla Supa Shampoo 300mL',
        coinsNeeded: 60,
        imagePath: 'lib/Images/shampoo.png',
        isLocked: true,
        milestone: 2,
      ),
      Products(
        name: 'Seazons Toilet Tissue 10 rolls',
        coinsNeeded: 80,
        imagePath: 'lib/Images/tissue.png',
        isLocked: true,
        milestone: 2,
      ),
      Products(
        name: 'Top Detergent Powder Super White 2.3kg',
        coinsNeeded: 80,
        imagePath: 'lib/Images/washingpowder.jpg',
        isLocked: true,
        milestone: 2,
      ),
    ];

    return Scaffold(
      backgroundColor: Color(0xFFF3FCF7),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ProductViewGrid(products: dailyItems),
      ),
    );
  }
}
