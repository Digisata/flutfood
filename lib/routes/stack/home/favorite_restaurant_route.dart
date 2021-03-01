import 'package:flutfood/commons/color_data.dart';
import 'package:flutfood/commons/size_data.dart';
import 'package:flutfood/commons/text_data.dart';
import 'package:flutfood/providers/app_provider.dart';
import 'package:flutfood/providers/catalog_product_provider.dart';
import 'package:flutfood/providers/favorite_restaurant_provider.dart';
import 'package:flutfood/widgets/back_button_widget.dart';
import 'package:flutfood/widgets/custom_text_widget.dart';
import 'package:flutfood/widgets/list_of_favorite_restaurants_widget.dart';
import 'package:flutfood/widgets/loading_widget.dart';
import 'package:flutfood/widgets/refresher_widget.dart';
import 'package:flutfood/widgets/scroll_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:provider/provider.dart';

class FavoriteRestaurantRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FavoriteRestaurantProvider _favoriteRestaurantProvider =
        Provider.of<FavoriteRestaurantProvider>(context);
    final CatalogProductProvider _catalogProductProvider =
        Provider.of<CatalogProductProvider>(context);

    final ListOfFavoriteRestaurantsWidget _listOfFavoriteRestaurants =
        ListOfFavoriteRestaurantsWidget(
      listOfRestaurants: _favoriteRestaurantProvider.listOfFavoriteRestaurant,
      catalogProductProvider: _catalogProductProvider,
      favoriteRestaurantProvider: _favoriteRestaurantProvider,
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0.0,
        backgroundColor: ColorData.white,
        leading: BackButtonWidget(
          backTo: () {
            Navigator.pop(context);
          },
        ),
        title: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeData.padding8,
            vertical: SizeData.padding8,
          ),
          child: CustomTextWidget(
            text: TextData.textFavorite,
            color: ColorData.grey25,
            fontSize: SizeData.fontSize24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async => false,
        child: _favoriteRestaurantProvider.listOfFavoriteRestaurant.isEmpty
            ? const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextWidget(
                    text: TextData.textEmptyList,
                    color: ColorData.greyA0,
                    fontSize: SizeData.fontSize24,
                    maxLines: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : Consumer<AppProvider>(
                builder: (context, appProvider, _) => Stack(
                  children: [
                    RefresherWidget(
                      refreshController:
                          _favoriteRestaurantProvider.refreshController,
                      onRefresh: () {
                        _favoriteRestaurantProvider.refreshController
                            .refreshCompleted();
                      },
                      child: ScrollBodyWidget(
                        padding: const EdgeInsets.symmetric(
                          vertical: SizeData.padding25,
                        ),
                        body: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Consumer<FavoriteRestaurantProvider>(
                              builder:
                                  (context, favoriteRestaurantProvider, _) =>
                                      _listOfFavoriteRestaurants,
                            ),
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
      ),
    );
  }
}
