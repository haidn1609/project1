import 'package:flutter/foundation.dart';

class ProviderController extends ChangeNotifier {
  int currentTab = 2;

  setCurrentTab(int index) {
    currentTab = index;
    notifyListeners();
  }
}
