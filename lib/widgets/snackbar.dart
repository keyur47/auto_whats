import 'package:auto_whats/utils/assets_path.dart';
import 'package:auto_whats/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';


/// Snackbar
SnackbarController getSnackBar(title, subtitle, backgroundColor, time) {
  return Get.snackbar(
    title,
    subtitle,
    icon: const Icon(Icons.person, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: backgroundColor,
    borderRadius: 20,
    margin: const EdgeInsets.all(15),
    colorText: Colors.white,
    duration: Duration(seconds: time ?? 3),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}

/// AppToast
class AppToast {
  static void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        fontSize: 14);
  }
}

///  noData
Widget noData(){
  return Image.asset(AssetsPath.noData,height: SizeUtils.verticalBlockSize * 30,);
}