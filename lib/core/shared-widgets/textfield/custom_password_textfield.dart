import 'package:flutter/material.dart';
import 'package:gallery/core/constants/app_colors.dart';

import '../../constants/app_styles.dart';

class CustomPasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintTxt;
  final FocusNode? focusNode;
  final FocusNode? nextNode;
  final TextInputAction? textInputAction;
  final Color? fillColor;

  const CustomPasswordTextField({
    super.key,
    this.controller,
    this.hintTxt,
    this.focusNode,
    this.nextNode,
    this.textInputAction,
    this.fillColor,
  });

  @override
  _CustomPasswordTextFieldState createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: TextFormField(
        cursorColor: Theme.of(context).primaryColor,
        controller: widget.controller,
        obscureText: _obscureText,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        onFieldSubmitted: (v) {
          setState(() {
            widget.textInputAction == TextInputAction.done
                ? FocusScope.of(context).consumeKeyboardToken()
                : FocusScope.of(context).requestFocus(widget.nextNode);
          });
        },
        validator: (value) {
          return null;
        },
        decoration: InputDecoration(
            suffixIcon: IconButton(
                icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility),
                onPressed: _toggle),
            hintText: widget.hintTxt ?? '',
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
            isDense: true,
            filled: true,
            fillColor: widget.fillColor ?? Theme.of(context).highlightColor,
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
            hintStyle: const TextStyle(color: AppColors.fontColor),
            border: InputBorder.none),
      ),
    );
  }
}
