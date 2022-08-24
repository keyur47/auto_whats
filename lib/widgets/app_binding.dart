
import 'package:auto_whats/Auth/controller/forget_password_controller.dart';
import 'package:auto_whats/Auth/controller/sign_in_controller.dart';
import 'package:auto_whats/Auth/controller/sign_up_controller.dart';
import 'package:auto_whats/Auth/logout/home_controller.dart';
import 'package:auto_whats/ads/adr.controller.dart';
import 'package:auto_whats/modules/appbar/popupmenubutton/about/theme.dart';
import 'package:auto_whats/modules/appbar/popupmenubutton/supportedapp_page/supporredapp_controller.dart';
import 'package:auto_whats/modules/controller/all_screen_controller.dart';
import 'package:auto_whats/modules/create_reply_page/create_reply_controller.dart';
import 'package:auto_whats/modules/splashscreen/splash_screen_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ThemeController>(ThemeController());
    Get.put<LogInController>(LogInController());
    Get.put<SignUpController>(SignUpController());
    Get.put<HomeController>(HomeController());
    Get.put<ForgetPasswordController>(ForgetPasswordController());
    Get.put<SplashController>(SplashController());
    Get.put<AllScreenController>(AllScreenController());
    Get.put<AdController>(AdController());
    Get.put<CreateReplyController>(CreateReplyController());

  }
}
