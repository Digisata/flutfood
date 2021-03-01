import 'package:flutter/foundation.dart';

class LandingProvider with ChangeNotifier {
  int currentPage = 0;

  void setCurrentPage(int index) {
    currentPage = index;
    notifyListeners();
  }
}
