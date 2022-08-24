import 'package:auto_whats/utils/app_color.dart';
import 'package:auto_whats/utils/assets_path.dart';
import 'package:auto_whats/utils/my_behavior.dart';
import 'package:auto_whats/utils/navigation/dart/route_page.dart';
import 'package:auto_whats/widgets/app_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class AutoWhats extends StatelessWidget {
  AutoWhats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColor.backgroundColor,
          body: ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!,
          ),
        );
      },
      theme: ThemeData(
          fontFamily: AssetsPath.roboto,
          colorScheme:
          Theme.of(context).colorScheme.copyWith(secondary: Colors.red)),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      getPages: Routes.routes,
      initialBinding: AppBinding(),
    );
  }
}
