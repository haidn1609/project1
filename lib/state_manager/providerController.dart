import 'package:flutter/foundation.dart';

class ProviderController extends ChangeNotifier {
  int currentTab = 1;
  int differenceDay = 0;

  setCurrentTab(int index) {
    currentTab = index;
    notifyListeners();
  }

  setDifferenceDay(int difference) {
    differenceDay = difference;
    notifyListeners();
  }
}
