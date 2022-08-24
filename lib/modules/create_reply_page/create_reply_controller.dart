import 'dart:convert';

import 'package:auto_whats/helper/shared_preferences.dart';
import 'package:auto_whats/modules/create_reply_page/datasources/create_reply_model.dart';
import 'package:auto_whats/utils/appString.dart';
import 'package:auto_whats/widgets/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateReplyController extends GetxController {
  final TextEditingController inComingKeywordController =
      TextEditingController();
  final TextEditingController replyMassageController = TextEditingController();
  RxList<CreateReplyModel> createModal = <CreateReplyModel>[].obs;

  String? inComingKeywordValidator() {
    if (inComingKeywordController.text.isEmpty) {
      AppToast.toastMessage(
        AppString.enterInComingKeyword,
      );
    }
  }

  String? replyMassageValidator() {
    if (replyMassageController.text.isEmpty) {
      AppToast.toastMessage(
        AppString.enterReplyMassage,
      );
    }
  }

  @override
  void onInit() {
    if (AppPreference.getString("CreateReplyModel") != "") {
      final Iterable l =
          json.decode(AppPreference.getString("CreateReplyModel"));
      final List<CreateReplyModel> posts = List<CreateReplyModel>.from(
          l.map((model) => CreateReplyModel.fromJson(model)));
      createModal.clear();
      createModal.addAll(posts);
    }

    super.onInit();
  }
}
