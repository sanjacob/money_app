class Money {
  final double value;
  Money({required this.value});
  
  int get pounds => value.truncate();
  int get pennies => ((value - value.truncate()) * 100).truncate().abs();
  String get sign => (value.isNegative) ? '' : '+';
} 