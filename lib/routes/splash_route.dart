import 'dart:async';

import 'package:flutfood/commons/color_data.dart';
import 'package:flutfood/commons/constant_data.dart';
import 'package:flutfood/commons/size_data.dart';
import 'package:flutfood/commons/text_data.dart';
import 'package:flutfood/widgets/custom_text_widget.dart';
import 'package:flutfood/widgets/image_svg_widget.dart';
import 'package:flutter/material.dart';

class SplashRoute extends StatefulWidget {
  @override
  _SplashRouteState createState() => _SplashRouteState();
}

class _SplashRouteState extends State<SplashRoute> {
  int _duration = 0;

  void startProgressIndicator() {
    const Duration _tenMiliSec = Duration(milliseconds: 10);
    Timer.periodic(
      _tenMiliSec,
      (Timer timer) {
        if (_duration == 5000) {
          timer.cancel();
          _duration = 0;
          Navigator.pushNamedAndRemoveUntil(
              context, ConstantData.landingRoute, (route) => false);
        } else {
          setState(() {
            _duration += 10;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: SizeData.padding25,
          ),
          color: Colors.white,
          child: Stack(
            children: [
              Column(
                children: [
                  const Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: LinearProgressIndicator(
                      minHeight: 10.0,
                      value: _duration / 5000,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        ColorData.green0B,
                      ),
                      backgroundColor: ColorData.bgGreyF7,
                    ),
                  ),
                  const SizedBox(
                    height: 100.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: SizeData.padding30,
                    ),
                    child: Center(
                      child: CustomTextWidget(
                        text: TextData.textCopyright,
                        color: ColorData.grey25,
                        fontSize: SizeData.fontSize10,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              const Center(
                child: ImageSvgWidget(
                  imagePath: 'assets/images/flutfood_logo.svg',
                  height: SizeData.imageHeight200,
                  width: SizeData.imageWidth200,
                  loadingSize: SizeData.imageLoadingSize50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
