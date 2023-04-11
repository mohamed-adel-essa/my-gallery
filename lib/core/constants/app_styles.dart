import 'package:flutter/material.dart';
import 'package:gallery/core/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

const titleHeadH1 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
  fontFamily: 'segoe',
);
const titleHeadH2 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 18,
  fontFamily: 'segoe',
);
const titleHeadH3 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16,
  fontFamily: 'segoe',
);
const titleHeadH4 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16,
  fontFamily: 'segoe',
);

const bodyH2 = TextStyle(
  fontWeight: FontWeight.normal,
  fontSize: 16,
  fontFamily: 'segoe',
);
const bodyH3 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 14,
  fontFamily: 'segoe',
);
const buttonH1TextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16,
  fontFamily: 'segoe',
);

const buttonH2TextStyle = TextStyle(
  fontWeight: FontWeight.normal,
  fontSize: 16,
  fontFamily: 'segoe',
);

InputDecoration getTextFieldDecoration({
  required BuildContext context,
  required String label,
  Widget? prefixIcon,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.blackColor,
      ),
      borderRadius: BorderRadius.circular(15.0),
    ),
    fillColor: AppColors.greyColor,
    labelText: label,
    labelStyle: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor,
    ),
    floatingLabelStyle: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor,
    ),
  );
}
