import 'package:debtstiny/Components/User.dart';
import 'package:debtstiny/Components/product_viewGrid.dart';
import 'package:debtstiny/Components/products.dart';

import 'package:flutter/material.dart';

class RedeemVoucherPage extends StatelessWidget {
  final User user;

  const RedeemVoucherPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  static List<Products> voucherItems = [
    Products(
      name: 'Tngo eWallet Reload Pin RM10',
      coinsNeeded: 30,
      imagePath: 'lib/Images/tngo10.png',
      isLocked: true,
      milestone: 1,
    ),
    Products(
      name: 'Tngo eWallet Reload Pin RM50',
      coinsNeeded: 130,
      imagePath: 'lib/Images/tngo50.png',
      isLocked: true,
      milestone: 1,
    ),
    Products(
      name: 'Tngo eWallet Reload Pin RM100',
      coinsNeeded: 220,
      imagePath: 'lib/Images/tngo100.webp',
      isLocked: true,
      milestone: 2,
    ),
    Products(
      name: 'DebtStiny Discount Promo Code RM500',
      coinsNeeded: 1000,
      imagePath: 'lib/Images/debt500.jpg',
      isLocked: true,
      milestone: 2,
    ),
    Products(
      name: 'DebtStiny Discount Promo Code RM1000',
      coinsNeeded: 1900,
      imagePath: 'lib/Images/debt1000.jpg',
      isLocked: true,
      milestone: 3,
    ),
    Products(
      name: 'DebtStiny Discount Promo Code RM2000',
      coinsNeeded: 3500,
      imagePath: 'lib/Images/debt2000.jpg',
      isLocked: true,
      milestone: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    for(int i=0; i<voucherItems.length; i++){
      if(user.milestone>=voucherItems[i].milestone){
        voucherItems[i].isLocked=false;
      }
    }

    return Scaffold(
      backgroundColor: Color(0xFFF3FCF7),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ProductViewGrid(products: voucherItems),
      ),
    );
  }
}
