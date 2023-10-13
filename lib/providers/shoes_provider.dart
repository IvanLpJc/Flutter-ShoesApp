import 'package:flutter/material.dart';

class ShoesProvider extends ChangeNotifier {
  int _sizeSelected = 0;
  String _currentImage = 'assets/images/azul.png';

  int get sizeSelected => _sizeSelected;

  String get currentImage => _currentImage;

  set sizeSelected(int value) {
    _sizeSelected = value;
    notifyListeners();
  }

  set currentImage(String value) {
    switch (int.parse(value)) {
      case 1:
        _currentImage = 'assets/images/negro.png';
        break;
      case 2:
        _currentImage = 'assets/images/amarillo.png';
        break;
      case 3:
        _currentImage = 'assets/images/azul.png';
        break;
      case 4:
        _currentImage = 'assets/images/verde.png';
        break;
    }
    notifyListeners();
  }
}
