import 'package:auto_whats/helper/app_color.dart';
import 'package:auto_whats/modules/appbar/popupmenubutton/about/theme.dart';
import 'package:auto_whats/modules/create_reply_page/create_reply_controller.dart';
import 'package:auto_whats/utils/appString.dart';
import 'package:auto_whats/utils/assets_path.dart';
import 'package:auto_whats/utils/navigation/dart/navigation.dart';
import 'package:auto_whats/utils/navigation/dart/route_page.dart';
import 'package:auto_whats/utils/size_utils.dart';
import 'package:auto_whats/widgets/app_text.dart';
import 'package:auto_whats/widgets/button_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class CreateReply extends StatefulWidget {
  CreateReply({Key? key}) : super(key: key);

  @override
  State<CreateReply> createState() => _CreateReplyState();
}

class _CreateReplyState extends State<CreateReply> {
  final ThemeController themeController = Get.find();

  final CreateReplyController _createReplyController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: ColorRes.backgroundColor(context),
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: themeController.isSwitched.value
              ? AppColor.darkThem.withOpacity(0.2)
              : AppColor.whiteColor,
          leadingWidth: SizeUtils.horizontalBlockSize * 11.5,
          leading: GestureDetector(
            onTap: () {
              Navigation.pop();
              // Navigation.replaceAll(Routes.homePage);
            },
            child: Padding(
              padding:
                  EdgeInsets.only(left: SizeUtils.horizontalBlockSize * 4.2),
              child: Image.asset(
                AppIcons.backIcon,
                color: ColorRes.appBarBackground(context),
              ),
            ),
          ),
          title: AppText(
            AppString.createReply,
            fontSize: SizeUtils.fSize_17(),
            fontWeight: FontWeight.w600,
            color: ColorRes.textColor(context),
          ),
          // actions: [
          //   Padding(
          //     padding:
          //         EdgeInsets.only(right: SizeUtils.horizontalBlockSize * 4),
          //     child: GestureDetector(
          //       onTap: () {},
          //       child: Image.asset(
          //         AppIcons.more,
          //         width: SizeUtils.fSize_24(),
          //         color: ColorRes.appBarBackground(context),
          //       ),
          //     ),
          //   ),
          // ],
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                if (_createReplyController.createModal.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                      itemCount: _createReplyController.createModal.length,
                      padding: EdgeInsets.symmetric(
                          vertical: SizeUtils.verticalBlockSize * 2),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeUtils.horizontalBlockSize * 2.5,
                              vertical: SizeUtils.verticalBlockSize * 0.5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: themeController.isSwitched.value
                                  ? AppColor.homeScreen.withOpacity(0.1)
                                  : AppColor.appBackgroundColor,
                              // border: Border.all(width: 0.1, color: AppColor.textColor),
                              borderRadius: BorderRadius.circular(
                                  SizeUtils.horizontalBlockSize * 3),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeUtils.horizontalBlockSize * 3.5,
                                vertical: SizeUtils.verticalBlockSize * 1.2,
                              ),
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                          ),
                                          color: AppColor.primaryColor
                                              .withOpacity(0.2),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical:
                                                SizeUtils.verticalBlockSize * 1,
                                            horizontal:
                                                SizeUtils.horizontalBlockSize *
                                                    3,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              AppText(
                                                "${_createReplyController.createModal[index].inComingKeyword}",
                                                color:
                                                    ColorRes.textColor(context),
                                                fontSize: SizeUtils.fSize_16(),
                                                fontWeight: FontWeight.w400,
                                              ),
                                              SizedBox(
                                                height: SizeUtils
                                                        .verticalBlockSize *
                                                    1,
                                              ),
                                              AppText(
                                                DateFormat("hh:mm a").format(
                                                    _createReplyController
                                                            .createModal[index]
                                                            .time ??
                                                        DateTime.now()),
                                                textAlign: TextAlign.end,
                                                fontSize: SizeUtils.fSize_10(),
                                                fontWeight: FontWeight.w500,
                                                color: themeController
                                                        .isSwitched.value
                                                    ? AppColor.lightThem
                                                        .withOpacity(0.7)
                                                    : AppColor.backIconColor
                                                        .withOpacity(0.6),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      // SizedBox(
                                      //   height: SizeUtils.verticalBlockSize * 1.2,
                                      // ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: SizeUtils.horizontalBlockSize *
                                              3.5,
                                        ),
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                              ),
                                              color: AppColor.primaryColor,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: SizeUtils
                                                          .verticalBlockSize *
                                                      1,
                                                  horizontal: SizeUtils
                                                          .horizontalBlockSize *
                                                      4),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  AppText(
                                                    "${_createReplyController.createModal[index].replyMassage}",
                                                    color: AppColor.lightThem,
                                                    fontSize:
                                                        SizeUtils.fSize_16(),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  SizedBox(
                                                    height: SizeUtils
                                                            .verticalBlockSize *
                                                        1,
                                                  ),
                                                  AppText(
                                                    DateFormat("hh:mm a").format(
                                                        _createReplyController
                                                                .createModal[
                                                                    index]
                                                                .time ??
                                                            DateTime.now()),
                                                    textAlign: TextAlign.end,
                                                    fontSize:
                                                        SizeUtils.fSize_10(),
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor.lightThem
                                                        .withOpacity(0.7),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: SizeUtils.verticalBlockSize * 1.2,
                                      // ),
                                      // Divider(
                                      //   thickness: 0.2,
                                      //   color: ColorRes.textColor(context),
                                      // )
                                    ],
                                  ),
                                  Positioned(
                                    top: -15,
                                    right: -15,
                                    child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  10.0,
                                                ),
                                              ),
                                              backgroundColor: themeController
                                                      .isSwitched.value
                                                  ? ColorCollection
                                                      .backGroundColorDark
                                                  : AppColor.lightThem,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: SizeUtils
                                                            .verticalBlockSize *
                                                        3,
                                                    horizontal: SizeUtils
                                                            .horizontalBlockSize *
                                                        5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Image.asset(
                                                        AppIcons.deleteIcon),
                                                    SizedBox(
                                                        height: SizeUtils
                                                                .verticalBlockSize *
                                                            1.2),
                                                    AppText(
                                                      "Whatsapp Auto Delete",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize:
                                                          SizeUtils.fSize_16(),
                                                    ),
                                                    SizedBox(
                                                        height: SizeUtils
                                                                .verticalBlockSize *
                                                            1.5),
                                                    AppText(
                                                      "Are you sure you want "
                                                      "to delete this "
                                                      "message?",
                                                      color: ColorRes.textColor(
                                                              context)
                                                          .withOpacity(0.7),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize:
                                                          SizeUtils.fSize_14(),
                                                    ),
                                                    SizedBox(
                                                        height: SizeUtils
                                                                .verticalBlockSize *
                                                            1.5),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            Navigation.pop();
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: ColorRes
                                                                        .textColor(
                                                                            context)
                                                                    .withOpacity(
                                                                        0.3),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                vertical: SizeUtils
                                                                        .verticalBlockSize *
                                                                    1.2,
                                                                horizontal:
                                                                    SizeUtils
                                                                            .horizontalBlockSize *
                                                                        8,
                                                              ),
                                                              child: AppText(
                                                                "Cancel",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: SizeUtils
                                                                    .fSize_16(),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            _createReplyController
                                                                .createModal
                                                                .removeAt(
                                                                    index);
                                                            Navigation.pop();
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .red.shade500,
                                                              border:
                                                                  Border.all(
                                                                color: ColorRes
                                                                        .textColor(
                                                                            context)
                                                                    .withOpacity(
                                                                        0.3),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                vertical: SizeUtils
                                                                        .verticalBlockSize *
                                                                    1.3,
                                                                horizontal:
                                                                    SizeUtils
                                                                            .horizontalBlockSize *
                                                                        8.3,
                                                              ),
                                                              child: AppText(
                                                                "Delete",
                                                                color: AppColor
                                                                    .whiteColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: SizeUtils
                                                                    .fSize_16(),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: themeController.isSwitched.value
                                            ? AppColor.lightThem
                                                .withOpacity(0.7)
                                            : AppColor.backIconColor
                                                .withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                else
                  Column(
                    children: [
                      SizedBox(height: SizeUtils.verticalBlockSize * 30),
                      Image.asset(
                        AssetsPath.edit,
                        // width: SizeUtils.horizontalBlockSize * 48,
                        color: AppColor.primaryColor,
                      ),
                      SizedBox(
                        height: SizeUtils.fSize_14(),
                      ),
                      AppText(
                        AppString.customReply,
                        fontSize: SizeUtils.fSize_18(),
                        fontWeight: FontWeight.w600,
                        color: ColorRes.textColor(context),
                      ),
                      SizedBox(
                        height: SizeUtils.fSize_10(),
                      ),
                      AppText(
                        AppString.tapToBelow,
                        textAlign: TextAlign.center,
                        fontSize: SizeUtils.fSize_14(),
                        fontWeight: FontWeight.w400,
                        color: ColorRes.textColor(context).withOpacity(0.5),
                      ),
                    ],
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: SizeUtils.horizontalBlockSize * 8,
                left: SizeUtils.horizontalBlockSize * 4,
                right: SizeUtils.horizontalBlockSize * 4,
              ),
              child: createButton(
                onTap: () {
                  Navigation.pushNamed(Routes.createCustomReply);
                  _createReplyController.inComingKeywordController.clear();
                  _createReplyController.replyMassageController.clear();
                },
                text: AppString.create,
              ),
            )
          ],
        ),
      ),
    );
  }

// InkWell(
// onTap: () {
// setState(() {
// _createReplyController.createModal
//     .removeAt(index);
// });
// },
// child: Icon(
// Icons.close,
// color: ColorRes.textColor(context)
//     .withOpacity(0.5),
// ),
// ),

}
