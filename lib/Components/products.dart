class Products {
  final String name;
  final String imagePath;
  final int coinsNeeded;
  bool isLocked;
  final int milestone; 

  Products({
    required this.name,
    required this.imagePath,
    required this.coinsNeeded,
    this.isLocked = false,
    required this.milestone,
  });
}
