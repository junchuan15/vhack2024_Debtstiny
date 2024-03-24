class Payment {
  final double amount;
  final String ref_no;
  final DateTime dateTime;
  final String trans_type;
  final int coin;

  Payment({
    required this.amount,
    required this.ref_no,
    required this.dateTime,
    required this.trans_type,
    required this.coin,
  });
}
