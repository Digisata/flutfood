import 'dart:async';

import 'package:flutter/foundation.dart';

class AppProvider with ChangeNotifier {
  bool isAppLoading = false;
  int backButtonPressedCount = 0, _counter = 0;

  void setIsAppLoading(bool value) {
    isAppLoading = value;
    notifyListeners();
  }

  void startCountDownTimer() {
    const Duration _oneSec = Duration(seconds: 1);
    Timer.periodic(
      _oneSec,
      (Timer timer) {
        if (_counter == 10) {
          timer.cancel();
          _counter = 0;
          backButtonPressedCount = 0;
        } else {
          _counter++;
        }
      },
    );
  }
}
