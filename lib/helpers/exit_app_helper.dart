import 'package:flutfood/providers/app_provider.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutfood/commons/color_data.dart';
import 'package:flutfood/commons/text_data.dart';

class ExitAppHelper {
  static bool exitApp(AppProvider appProvider) {
    if (appProvider.backButtonPressedCount != 1) {
      appProvider.backButtonPressedCount++;
      appProvider.startCountDownTimer();
      Fluttertoast.showToast(
        msg: TextData.textExitApp,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: ColorData.black.withOpacity(0.5),
        textColor: ColorData.white,
        fontSize: 16.0,
      );
    } else {
      appProvider.backButtonPressedCount = 0;
      Fluttertoast.cancel();
      SystemNavigator.pop();
    }
    return false;
  }
}
