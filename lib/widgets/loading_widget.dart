import 'package:flutter/material.dart';
import 'package:loading/indicator.dart';
import 'package:loading/loading.dart';
import 'package:flutfood/commons/color_data.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    @required this.indicator,
    Key key,
    this.isFullScreen = true,
  }) : super(key: key);

  final Indicator indicator;
  final bool isFullScreen;

  @override
  Widget build(BuildContext context) {
    return isFullScreen
        ? Container(
            height: double.infinity,
            width: double.infinity,
            color: ColorData.white.withOpacity(0.3),
            child: Center(
              child: Container(
                height: 70.0,
                width: 70.0,
                padding: const EdgeInsets.all(
                  16.0,
                ),
                decoration: BoxDecoration(
                  color: ColorData.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Loading(
                  color: ColorData.green0B,
                  indicator: indicator,
                ),
              ),
            ),
          )
        : Center(
            child: Loading(
              color: ColorData.green0B,
              indicator: indicator,
            ),
          );
  }
}
