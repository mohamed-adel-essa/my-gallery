import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sizer/sizer.dart';

class GalleryImages extends StatelessWidget {
  GalleryImages({super.key, required this.imags});
  List imags;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return AnimationLimiter(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            children: List.generate(imags.length, (index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 375),
                columnCount: 3,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: ImageItem(imag: imags[index]),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}

class ImageItem extends StatelessWidget {
  const ImageItem({super.key, required this.imag});

  final String imag;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 20.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imag,
          width: 20.w,
          height: 20.w,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
