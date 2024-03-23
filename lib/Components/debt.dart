class Debt {
  final String image_url;
  final String creditor;
  final String type;
  final double balance;
  final double APR;
  final int duration;
  final DateTime paid_off_date;
  final double monthly_payment;
  final double progress;

  Debt({
    required this.image_url,
    required this.creditor,
    required this.type,
    required this.balance,
    required this.APR,
    required this.duration,
    required this.paid_off_date,
    required this.monthly_payment,
    required this.progress,
  });
}
