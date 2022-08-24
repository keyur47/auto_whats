import 'package:auto_whats/utils/app_color.dart';
import 'package:auto_whats/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


/// usernameTextField
Widget usernameTextField({
  required TextEditingController? controller,
  required bool? showCursor,
  required String? hintText,
  required TextInputType textInputType,
  required GestureTapCallback onTap,
  required GestureLongPressCallback?  longPress,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(SizeUtils.horizontalBlockSize * 10),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
          offset: Offset(4, 8), // Shadow position
        ),
      ],
    ),
    child: TextFormField(
      cursorColor: Colors.transparent,
        controller: controller,
        toolbarOptions: const ToolbarOptions(
          paste: false,
          copy: true,
          selectAll: true,
          cut: true,
        ),
        showCursor: false,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter(RegExp(r'[a-z_.0-9]'), allow: true)
        ],
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(SizeUtils.horizontalBlockSize * 10),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius:
                BorderRadius.circular(SizeUtils.horizontalBlockSize * 10),
                borderSide: BorderSide.none),
            enabled: true,
            contentPadding:
                EdgeInsets.only(top: SizeUtils.verticalBlockSize * 1.7),
            border: InputBorder.none,
            prefixIcon: const Icon(
              Icons.search,
              color: AppColor.darkBlue,
            ),
            suffixIcon: GestureDetector(
                onTap: onTap,
                onLongPress: longPress,
                child: const Icon(Icons.close, color: AppColor.darkBlue)),
            hintText: hintText,
            fillColor: AppColor.white,
            filled: true,
            hintStyle: const TextStyle(fontSize: 16))),
  );
}

// AllScreenController controller = Get.find();

/// FeedbackTextField
Widget FeedbackTextField({
  required TextEditingController? controller,
  int? maxLines,
  required Color color,
  required TextStyle textStyle,
  required TextStyle style,
  //bool? showCursor,
  required FocusNode? focusNode,
  required String? hintText,
  required Color cursorColor,
  TextInputType? textInputType,
  required BoxBorder? boxBorder,
  ValueChanged<String>? valueChanged,
  FormFieldValidator<String>? validator,
  EdgeInsetsGeometry? contentPadding,
  MaxLengthEnforcement? maxLengthEnforcement,
  Widget? suffixIcon,
}) {
  return Container(
    decoration: BoxDecoration(
        border: boxBorder,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(4, 8), // Shadow position
          ),
        ],
        color: color,
        borderRadius: BorderRadius.circular(6)),
    child: Padding(
      padding: EdgeInsets.only(left: 5, right: 2),
      child: TextFormField(
        toolbarOptions: const ToolbarOptions(
          paste: true,
          copy: true,
          selectAll: true,
          cut: true,
        ),
        enabled: true,
        // maxLines: maxLines,
        maxLines: null,
        // maxLength: 150,
        // maxLengthEnforcement: maxLengthEnforcement,
        decoration: InputDecoration(
          contentPadding: contentPadding,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: textStyle,
          suffix: suffixIcon,
        ),
        controller: controller,
        onChanged: valueChanged,
        // showCursor: showCursor,
        style: style,
        keyboardType: textInputType,
        validator: validator,
        // focusNode: focusNode,
        cursorColor: cursorColor,
      ),
    ),
  );
}






///  phoneNumberTextField
//Widget phoneNumberTextField({
//   required TextEditingController? controller,
//   required bool? showCursor,
//   required String? hintText,
//   required TextInputType textInputType,
//   required GestureTapCallback onTap,
//   required GestureLongPressCallback onLongPress,
//   required ValueChanged<String>? onChanged,
// }) {
//   return Container(
//     decoration: BoxDecoration(boxShadow: const [
//       BoxShadow(
//         color: Colors.black12,
//         blurRadius: 4,
//         offset: Offset(4, 8), // Shadow position
//       ),
//     ], borderRadius: BorderRadius.circular(6), color: Colors.white),
//     child: Center(
//       child: FocusScope(
//         node: FocusScopeNode(),
//         child: TextFormField(
//             enableInteractiveSelection: true,
//             controller: controller,
//             toolbarOptions: const ToolbarOptions(
//               paste: false,
//               copy: true,
//               selectAll: true,
//               cut: true,
//             ),
//             autofocus: true,
//             keyboardType: TextInputType.phone,
//             inputFormatters: <TextInputFormatter>[
//               FilteringTextInputFormatter(RegExp(r'[0-9+]'), allow: true)
//             ],
//             onChanged: onChanged,
//             decoration: InputDecoration(
//                 enabled: true,
//                 contentPadding: EdgeInsets.only(top: 1.8, left: 7),
//                 border: InputBorder.none,
//                 // prefixIcon: Icon(
//                 //   Icons.search,
//                 //   color: AppColors.darkBlue,
//                 // ),
//                 suffixIcon: GestureDetector(
//                     onTap: onTap,
//                     onLongPress: onLongPress,
//                     child: Icon(
//                       Icons.close,
//                       color: AppColor.darkBlue,
//                       size: 6,
//                     )),
//                 hintText: hintText,
//                 hintStyle: TextStyle(fontSize: 16))),
//       ),
//     ),
//   );
// }