import '../Entities/debt.dart';

class Plan {
  final double duration;
  final String paidOffDate;
  final List<Debt> debtList;
  final double interest;
  final double monthly_payment;
  final double total;

  Plan({
    required this.duration,
    required this.paidOffDate,
    required this.debtList,
    required this.interest,
    required this.monthly_payment,
    required this.total,
  });
}

