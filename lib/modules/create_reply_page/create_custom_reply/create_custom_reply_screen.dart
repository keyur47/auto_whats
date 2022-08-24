import 'dart:convert';
import 'package:auto_whats/helper/app_color.dart';
import 'package:auto_whats/helper/shared_preferences.dart';
import 'package:auto_whats/modules/appbar/popupmenubutton/about/theme.dart';
import 'package:auto_whats/modules/create_reply_page/create_reply_controller.dart';
import 'package:auto_whats/modules/create_reply_page/datasources/create_reply_model.dart';
import 'package:auto_whats/utils/appString.dart';
import 'package:auto_whats/utils/assets_path.dart';
import 'package:auto_whats/utils/navigation/dart/navigation.dart';
import 'package:auto_whats/utils/navigation/dart/route_page.dart';
import 'package:auto_whats/utils/size_utils.dart';
import 'package:auto_whats/widgets/app_text.dart';
import 'package:auto_whats/widgets/app_textfield.dart';
import 'package:auto_whats/widgets/button_box.dart';
import 'package:auto_whats/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class CreateCustomReply extends StatefulWidget {
  CreateCustomReply({Key? key}) : super(key: key);

  @override
  State<CreateCustomReply> createState() => _CreateCustomReplyState();
}

class _CreateCustomReplyState extends State<CreateCustomReply> {
  final ThemeController themeController = Get.find();

  final CreateReplyController _createReplyController = Get.find();
  GlobalKey<FormState> createReplyKey = GlobalKey<FormState>();

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
            AppString.createCustomReply,
            fontSize: SizeUtils.fSize_17(),
            fontWeight: FontWeight.w600,
            color: ColorRes.textColor(context),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeUtils.horizontalBlockSize * 5,
              vertical: SizeUtils.verticalBlockSize * 3),
          child: Form(
            key: createReplyKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  AppString.CreateYourOwnChatBot,
                  fontSize: SizeUtils.fSize_14(),
                  fontWeight: FontWeight.w400,
                  color: ColorRes.textColor(context),
                ),
                SizedBox(
                  height: SizeUtils.verticalBlockSize * 4,
                ),
                AppTextField(
                  controller: _createReplyController.inComingKeywordController,
                  hintText: AppString.incomingKeyword,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: SizeUtils.verticalBlockSize * 0.5,
                      horizontal: SizeUtils.horizontalBlockSize * 4),
                ),
                SizedBox(
                  height: SizeUtils.verticalBlockSize * 2,
                ),
                AppTextField(
                  controller: _createReplyController.replyMassageController,
                  hintText: AppString.replyMassage,
                ),
                const Spacer(),
                createButton(
                  onTap: () {
                    final CreateReplyModel createReplyModel =
                        CreateReplyModel();
                    if (_createReplyController
                            .inComingKeywordController.text.isEmpty &&
                        _createReplyController
                            .replyMassageController.text.isEmpty) {
                      AppToast.toastMessage(
                        AppString.invalidArgument,
                      );
                    } else if (_createReplyController
                            .replyMassageController.text.isEmpty &&
                        _createReplyController
                            .inComingKeywordController.text.isNotEmpty) {
                      AppToast.toastMessage(
                        AppString.enterReplyMassage,
                      );
                    } else if (_createReplyController
                            .inComingKeywordController.text.isEmpty &&
                        _createReplyController
                            .replyMassageController.text.isNotEmpty) {
                      AppToast.toastMessage(
                        AppString.enterInComingKeyword,
                      );
                    } else {
                      createReplyModel.inComingKeyword =
                          _createReplyController.inComingKeywordController.text;
                      createReplyModel.replyMassage =
                          _createReplyController.replyMassageController.text;
                      createReplyModel.time = DateTime.now();
                      _createReplyController.createModal.add(createReplyModel);
                      saveMethode();
                      // setState(() {});
                      Navigation.pushNamed(Routes.createReply);
                    }
                  },
                  text: AppString.save,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveMethode() {
    AppPreference.setString(
        "CreateReplyModel", json.encode(_createReplyController.createModal));
    final Iterable l = json.decode(AppPreference.getString("CreateReplyModel"));
    final List<CreateReplyModel> posts = List<CreateReplyModel>.from(
        l.map((model) => CreateReplyModel.fromJson(model)));
    _createReplyController.createModal.clear();
    _createReplyController.createModal.addAll(posts);

    const platform = MethodChannel('samples.flutter.dev/battery');

    platform.invokeMethod('addNewMessage', {
      "message":
          _createReplyController.inComingKeywordController.text
              .toLowerCase()
              .trim(),
      "replyMessage": _createReplyController.replyMassageController.text.trim(),
    });
    print(
        "message---------->>>>>>>> ${_createReplyController.inComingKeywordController.text}");
    print(
        "replyMessage---------->>>>>>>> ${_createReplyController.replyMassageController.text.trim()}");
  }
}
