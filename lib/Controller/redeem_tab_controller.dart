import 'package:debtstiny/Pages/redeem_food_page.dart';
import 'package:flutter/material.dart';
import 'package:debtstiny/Components/home_backBar.dart';
import 'package:debtstiny/Components/scoinBox.dart';
import 'package:debtstiny/Components/redeemProgressBar.dart';
import 'package:debtstiny/Pages/redeem_daily_page.dart';
import 'package:debtstiny/Pages/redeem_voucher_page.dart';

class RedeemTabController extends StatefulWidget {
  const RedeemTabController({Key? key}) : super(key: key);

  @override
  _RedeemTabControllerState createState() => _RedeemTabControllerState();
}

class _RedeemTabControllerState extends State<RedeemTabController>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3FCF7),
      appBar: HomeBackBar(
        title: 'Redeem',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScoinBox(scoinCount: 993),
          RedeemProgressBar(),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20), 
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Color(0xFF152C51),
                borderRadius: BorderRadius.circular(20), 
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Color(0xFF152C51),
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(
                  child: Text(
                    'Food',
                    style: TextStyle(
                      fontFamily: 'PT Sans',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Daily',
                    style: TextStyle(
                      fontFamily: 'PT Sans',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Vouchers',
                    style: TextStyle(
                      fontFamily: 'PT Sans',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                RedeemFoodPage(),
                RedeemDailyPage(),
                RedeemVoucherPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
