import 'package:flutfood/commons/color_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageSvgWidget extends StatelessWidget {
  const ImageSvgWidget({
    @required this.imagePath,
    @required this.height,
    @required this.width,
    Key key,
    this.loadingSize,
    this.isNeedLoading = true,
  }) : super(key: key);

  final String imagePath;
  final double height, width, loadingSize;
  final bool isNeedLoading;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      height: height,
      width: width,
      placeholderBuilder: (context) => Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SizedBox(
            height: height,
            width: width,
          ),
          isNeedLoading
              ? SizedBox(
                  height: loadingSize,
                  width: loadingSize,
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ColorData.green0B,
                    ),
                  ),
                )
              : const IgnorePointer(),
        ],
      ),
    );
  }
}
