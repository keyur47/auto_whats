
import 'package:auto_whats/ads/ads.dart';
import 'package:auto_whats/helper/shared_preferences.dart';
import 'package:auto_whats/modules/appbar/appbar.dart';
import 'package:auto_whats/modules/controller/all_screen_controller.dart';
import 'package:auto_whats/modules/openbutton/oepn_username_snapchat.dart';
import 'package:auto_whats/utils/app_color.dart';
import 'package:auto_whats/utils/navigation/dart/navigation.dart';
import 'package:auto_whats/utils/navigation/dart/route_page.dart';
import 'package:auto_whats/utils/size_utils.dart';
import 'package:auto_whats/utils/string_utils.dart';
import 'package:auto_whats/widgets/custom_textfield.dart';
import 'package:auto_whats/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Snapchat extends StatefulWidget {
  @override
  _SnapchatState createState() => _SnapchatState();
}

class _SnapchatState extends State<Snapchat> {
  AllScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigation.popAndPushNamed(Routes.telegram);
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                customAppbar(
                  text: StringsUtils.snapchatDirects,
                  icon: Icons.snapchat,
                  iconColor: Colors.white,
                  gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColor.darkBlue,
                        AppColor.darkBlue,
                      ]),
                  top: SizeUtils.horizontalBlockSize * 1,
                  bottom: SizeUtils.horizontalBlockSize * 1.1,
                  right: SizeUtils.horizontalBlockSize * 1.4,
                  left: SizeUtils.horizontalBlockSize * 1.4,
                  size: SizeUtils.horizontalBlockSize * 10,
                  directText: StringsUtils.snapchatDirects,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeUtils.horizontalBlockSize * 4,
                      right: SizeUtils.horizontalBlockSize * 4,
                      top: SizeUtils.horizontalBlockSize * 2),
                  child: Column(
                    children: [
                      usernameTextField(
                          controller: controller.snapchatUsernameController,
                          showCursor: false,
                          hintText: StringsUtils.username,
                          textInputType: TextInputType.none,
                          onTap: () async {
                            controller.snapchatUsernameController.text =
                                controller.snapchatUsernameController.text
                                    .substring(
                                        0,
                                        controller.snapchatUsernameController
                                                .text.length -
                                            1);
                          },
                          longPress: () async {
                            controller.snapchatUsernameController.clear();
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeUtils.horizontalBlockSize * 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [OpenUserNameSnapchat()],
                ),
                Expanded(
                    child: Obx(
                  () => controller.getSnapchatUsernameList.isNotEmpty
                      ? AnimationLimiter(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            controller:
                                AllScreenController.myContactScrollController,
                            padding: EdgeInsets.zero,
                            itemCount:
                                controller.getSnapchatUsernameList.length,
                            itemBuilder: (context, index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                delay: const Duration(milliseconds: 300),
                                child: SlideAnimation(
                                  duration: const Duration(milliseconds: 800),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  child: FadeInAnimation(
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: SizeUtils.horizontalBlockSize *
                                              2.4,
                                          top:
                                              SizeUtils.verticalBlockSize * 0.5,
                                          right: SizeUtils.horizontalBlockSize *
                                              2),
                                      child: GestureDetector(
                                        child: Container(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: SizeUtils
                                                        .horizontalBlockSize *
                                                    2,
                                                top: SizeUtils
                                                        .verticalBlockSize *
                                                    0.5,
                                                bottom: SizeUtils
                                                        .verticalBlockSize *
                                                    0.5,
                                                right: SizeUtils
                                                        .horizontalBlockSize *
                                                    2),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor:
                                                      AppColor.darkBlue,
                                                  child: GestureDetector(
                                                    child: Text(
                                                      "${controller.getSnapchatUsernameList[index]}"
                                                          .substring(0, 1)
                                                          .toUpperCase(),
                                                      style: TextStyle(
                                                          color: AppColor.white,
                                                          fontSize: SizeUtils
                                                                  .horizontalBlockSize *
                                                              5,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: SizeUtils
                                                          .horizontalBlockSize *
                                                      3,
                                                ),
                                                Expanded(
                                                    child: GestureDetector(
                                                        onTap: () async {
                                                          controller
                                                                  .snapchatUsernameController
                                                                  .text =
                                                              "${controller.getSnapchatUsernameList[index]}";
                                                        },
                                                        onLongPress: () async {
                                                          controller.url.value =
                                                              "https://www.snapchat.com/add/${controller.getSnapchatUsernameList[index]}/";
                                                          await launch(
                                                              controller
                                                                  .url.value);
                                                          print(
                                                              "------${controller.url.value}");
                                                        },
                                                        child: Text(
                                                          "${controller.getSnapchatUsernameList[index]}",
                                                          style: TextStyle(
                                                              fontSize: SizeUtils
                                                                      .horizontalBlockSize *
                                                                  4.5),
                                                        ))),
                                                GestureDetector(
                                                  onTap: () async {
                                                    await controller
                                                        .setSnapchatUsernameList
                                                        .removeAt(index);
                                                    await controller
                                                        .getSnapchatUsernameList
                                                        .removeAt(index);
                                                    controller
                                                        .getSnapchatUsernameList
                                                        .refresh();
                                                    await AppPreference
                                                        .setSnapchatList(controller
                                                            .getSnapchatUsernameList);
                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.clear,
                                                    color: AppColor.grey
                                                        .withOpacity(0.5),
                                                    size: 20,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : Center(child: noData()),
                ))
              ],
            ),
            Container(
              child: BannerAds(),
            ),
          ],
        ),
      ),
    );
  }
}
