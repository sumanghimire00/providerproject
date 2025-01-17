import 'package:flutter/foundation.dart';

class SliderProvider with ChangeNotifier {
  double _value = 0.5;
  double get value => _value;

  void sliderChange(double val) {
    _value = val;
    notifyListeners();
  }
}
