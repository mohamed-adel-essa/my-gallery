import 'package:flutter/material.dart';
import 'package:gallery/core/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.onTap,
    required this.title,
    this.size,
    this.radius,
    this.fontSize,
    this.color,
    this.child,
  });
  final String title;
  final Function onTap;
  Color? color;
  Size? size;
  double? radius;
  Widget? child;
  double? fontSize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5, // Set the elevation to add the shadow
        shadowColor: Colors.grey, // Set the color of the shadow
        // Set the shape of the button (you can customize it as needed)
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 50),
        ),

        fixedSize: size ??
            Size(
              80.w,
              10.h,
            ),
        backgroundColor: color ?? AppColors.btnColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize ?? 20,
        ),
      ),
      onPressed: () {
        onTap();
      },
      child: child ??
          Text(
            title,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: fontSize ?? 20,
            ),
            textAlign: TextAlign.center,
          ),
    );
  }
}
