import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/app_colors.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? textInputType;
  final int? maxLine;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final TextInputAction? textInputAction;
  final bool isPhoneNumber;
  final bool isValidator;
  final String? validatorMessage;
  final Color? fillColor;
  final TextCapitalization capitalization;
  final bool isBorder;
  final Function? onSaved;
  final String? initValue;

  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.textInputType,
    this.maxLine,
    this.focusNode,
    this.nextNode,
    this.textInputAction,
    this.isPhoneNumber = false,
    this.isValidator = false,
    this.validatorMessage,
    this.capitalization = TextCapitalization.none,
    this.fillColor,
    this.isBorder = false,
    this.onSaved,
    this.initValue,
  });

  @override
  Widget build(context) {
    return TextFormField(
      textAlign: TextAlign.start,
      controller: controller,
      maxLines: maxLine ?? 1,
      textCapitalization: capitalization,
      maxLength: isPhoneNumber ? 15 : null,
      focusNode: focusNode,
      onSaved: onSaved == null
          ? null
          : (value) {
              onSaved!(value);
            },
      keyboardType: textInputType ?? TextInputType.text,
      initialValue: initValue,
      textInputAction: textInputAction ?? TextInputAction.next,
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(nextNode);
      },
      inputFormatters: [
        isPhoneNumber
            ? FilteringTextInputFormatter.digitsOnly
            : FilteringTextInputFormatter.singleLineFormatter
      ],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (input) {
        if (input!.isEmpty) {
          if (isValidator) {
            return validatorMessage ?? "";
          }
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText ?? '',
        hintStyle: const TextStyle(color: AppColors.fontColor),
        filled: fillColor != null,
        fillColor: fillColor,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
        isDense: true,
        counterText: '',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColors.whiteColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColors.whiteColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColors.whiteColor,
          ),
        ),
        errorStyle: const TextStyle(height: 1.5),
        border: InputBorder.none,
      ),
    );
  }
}
