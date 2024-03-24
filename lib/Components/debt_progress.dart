class DebtProgress {
  double _remaining;
  double _outstanding;
  double _mpaid;
  double _progress;
  double _total;
  double _paid;
  int _scoin;

  DebtProgress({
    required double remaining,
    required double outstanding,
    required double mpaid,
    required double progress,
    required double total,
    required double paid,
    required int scoin,
  })  : _remaining = remaining,
        _outstanding = outstanding,
        _mpaid = mpaid,
        _progress = progress,
        _total = total,
        _paid = paid,
        _scoin = scoin;

  double get remaining => _remaining;

  set remaining(double value) {
    _remaining = value;
  }

  double get outstanding => _outstanding;

  set outstanding(double value) {
    _outstanding = value;
  }

  double get mpaid => _mpaid;

  set mpaid(double value) {
    _mpaid = value;
  }

  double get progress => _progress;

  set progress(double value) {
    _progress = value;
  }

  double get total => _total;

  set total(double value) {
    _total = value;
  }

  double get paid => _paid;

  set paid(double value) {
    _paid = value;
  }

  int get scoin => _scoin;

  // Setter for scoin
  set scoin(int value) {
    _scoin = value;
  }
}
