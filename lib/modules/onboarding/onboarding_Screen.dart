
import 'package:auto_whats/helper/shared_preferences.dart';
import 'package:auto_whats/utils/navigation/dart/navigation.dart';
import 'package:auto_whats/utils/navigation/dart/route_page.dart';
import 'package:auto_whats/widgets/newt_box_buttons.dart';
import 'package:flutter/material.dart';

class onBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Stack(
        children: [
          Center(child: Text("SplashBox1")),
          Padding(
            padding: const EdgeInsets.only(bottom: 25, right: 15),
            child: Align(
                alignment: Alignment.bottomRight,
                child: boxNext(onTap: () async {
                  AppPreference.setInt(1);
                  AppPreference.getInt();
                  Navigation.popAndPushNamed(Routes.loginPage);
                })),
          )
        ],
      ),
    );
  }
}
