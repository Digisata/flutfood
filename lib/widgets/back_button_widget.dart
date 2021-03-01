import 'package:flutfood/commons/color_data.dart';
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    @required this.backTo,
    Key key,
  }) : super(key: key);

  final Function backTo;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        size: 35.0,
        color: ColorData.black,
      ),
      onPressed: () {
        backTo();
      },
    );
  }
}
