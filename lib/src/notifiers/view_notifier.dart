import 'package:flutter/cupertino.dart';

class ViewNotifier extends ChangeNotifier {
  bool listView = true;

  toggleView() {
    listView = !listView;
    notifyListeners();
  }
}

enum SortingTypes { name, date, price }

class SortingNotifier extends ChangeNotifier {
  int selected = 1;
  SortingTypes sortSelected = SortingTypes.name;

  sortByName(value) {
    selected = 1;
    sortSelected = value;
    notifyListeners();
  }

  sortByPrice(value) {
    selected = 2;
    sortSelected = value;
    notifyListeners();
  }

  sortByDate(value) {
    selected = 3;
    sortSelected = value;
    notifyListeners();
  }
}
