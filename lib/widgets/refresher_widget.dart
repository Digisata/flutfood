import 'package:flutter/material.dart';
import 'package:flutfood/commons/color_data.dart';
import 'package:flutfood/commons/text_data.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefresherWidget extends StatelessWidget {
  const RefresherWidget({
    @required this.refreshController,
    @required this.onRefresh,
    @required this.child,
    Key key,
  }) : super(key: key);

  final RefreshController refreshController;
  final Function onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      scrollDirection: Axis.vertical,
      header: const ClassicHeader(
        idleText: TextData.textPullToRefresh,
        releaseText: TextData.textRelease,
        refreshingText: TextData.textPleaseWait,
        completeText: TextData.textDone,
        failedText: TextData.textFailed,
        releaseIcon: Icon(
          Icons.arrow_upward,
          color: Colors.grey,
        ),
        textStyle: TextStyle(
          color: ColorData.grey52,
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
        ),
      ),
      controller: refreshController,
      onRefresh: () {
        onRefresh();
      },
      child: child,
    );
  }
}
