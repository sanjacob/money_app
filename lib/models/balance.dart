class Balance {
  final List<String> _pounds = [];
  final List<String> _pennies = [];

  bool decimal = false;

  String get pounds {
    return _pounds.join().padRight(1, '0');
  }

  String get pennies {
    return _pennies.join().padRight(2, '0');
  }

  @override
  String toString() {
    return '$pounds.$pennies';
  }

  double toDouble() {
    return double.parse(toString());
  }

  handleChar(String c) {
    switch (c) {
      case ".":
        if (!decimal){
          decimal = true;
        }
        break;
      case "<":
        removeChar();
        break;
      default:
        if (decimal) {
          if (_pennies.length > 2) {
            return;
          }
          if (_pennies.lastOrNull == '0' && c == '0') {
            return;
          }

          _pennies.add(c);
        } else {
          _pounds.add(c);
        }
    }
  }

  removeChar() {
    if (decimal) {
      if (_pennies.isNotEmpty) {
        _pennies.removeLast();
      }

      if (_pennies.isEmpty) {
        decimal = false;
      }
    } else {
      if (_pounds.isNotEmpty) {
        _pounds.removeLast();
      }
    }
  }
}