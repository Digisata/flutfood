import 'package:flutfood/helpers/exit_app_helper.dart';
import 'package:flutfood/providers/app_provider.dart';
import 'package:flutfood/providers/catalog_product_provider.dart';
import 'package:flutfood/providers/home_provider.dart';
import 'package:flutfood/widgets/list_of_restaurants_widget.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:flutfood/commons/size_data.dart';
import 'package:flutfood/widgets/loading_widget.dart';
import 'package:flutfood/widgets/refresher_widget.dart';
import 'package:flutfood/widgets/scroll_body_widget.dart';
import 'package:provider/provider.dart';

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeProvider _homeProvider = Provider.of<HomeProvider>(context);
    final AppProvider _appProvider = Provider.of<AppProvider>(context);
    final CatalogProductProvider _catalogProductProvider =
        Provider.of<CatalogProductProvider>(context);

    final ListOfRestaurantsWidget _listOfRestaurants = ListOfRestaurantsWidget(
      listOfRestaurants: _homeProvider.listOfRestaurants,
      catalogProductProvider: _catalogProductProvider,
    );

    return WillPopScope(
      onWillPop: () async => ExitAppHelper.exitApp(_appProvider),
      child: Consumer<AppProvider>(
        builder: (context, appProvider, _) => Stack(
          children: [
            RefresherWidget(
              refreshController: _homeProvider.refreshController,
              onRefresh: () {
                _homeProvider.refreshController.refreshCompleted();
              },
              child: ScrollBodyWidget(
                padding: const EdgeInsets.symmetric(
                  vertical: SizeData.padding25,
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _listOfRestaurants,
                  ],
                ),
              ),
            ),
            appProvider.isAppLoading
                ? LoadingWidget(
                    indicator: BallSpinFadeLoaderIndicator(),
                  )
                : const IgnorePointer(),
          ],
        ),
      ),
    );
  }
}
