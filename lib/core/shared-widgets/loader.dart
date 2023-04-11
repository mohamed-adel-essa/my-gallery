import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  Loader({
    super.key,
    required this.color,
    this.height = 30,
    this.width = 30,
  });
  final Color color;
  double? height;
  double? width;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch().copyWith(secondary: color)),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          width: height,
          height: width,
          child: SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              color: color,
              strokeWidth: 2,
            ),
          ),
        ),
      ),
    );
  }
}
