import 'package:flutter/foundation.dart';

class FavouriteList with ChangeNotifier {
  final List<int> _selectedItems = [];
  List<int> get selectedItems => _selectedItems;

  void addItem(val) {
    _selectedItems.add(val);
    notifyListeners();
  }

  void removeItem(val) {
    _selectedItems.remove(val);
    notifyListeners();
  }
}
