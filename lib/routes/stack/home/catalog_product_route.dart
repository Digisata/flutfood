import 'package:flutfood/providers/app_provider.dart';
import 'package:flutfood/providers/catalog_product_provider.dart';
import 'package:flutfood/providers/favorite_restaurant_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:flutfood/commons/color_data.dart';
import 'package:flutfood/commons/constant_data.dart';
import 'package:flutfood/commons/size_data.dart';
import 'package:flutfood/commons/text_data.dart';
import 'package:flutfood/widgets/Image_network_widget.dart';
import 'package:flutfood/widgets/custom_text_widget.dart';
import 'package:flutfood/widgets/image_svg_widget.dart';
import 'package:flutfood/widgets/list_of_products_widget.dart';
import 'package:flutfood/widgets/loading_widget.dart';
import 'package:flutfood/widgets/scroll_body_widget.dart';
import 'package:provider/provider.dart';

class CatalogProductRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CatalogProductProvider _catalogProductProvider =
        Provider.of<CatalogProductProvider>(context);

    final ListOfProductsWidget _listOfFoods = ListOfProductsWidget(
          listOfProducts: _catalogProductProvider.selectedRestaurant['menus']
              ['foods'] as List<dynamic>,
          imageUrl:
              'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?quality=90&resize=700%2C636',
        ),
        _listOfBeverage = ListOfProductsWidget(
          listOfProducts: _catalogProductProvider.selectedRestaurant['menus']
              ['drinks'] as List<dynamic>,
          imageUrl:
              'https://d2ih5qgee2kfcl.cloudfront.net/content/2020/05/08/Pjso9z/t_5eb5190fa3fdf_700.jpg',
        );

    return WillPopScope(
      onWillPop: () async => false,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: ColorData.transparent,
        ),
        child: Scaffold(
          body: Consumer<AppProvider>(
            builder: (context, appProvider, _) => Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ScrollBodyWidget(
                  isSafeTop: false,
                  body: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 300.0,
                            width: double.infinity,
                            child: Hero(
                              tag:
                                  '${ConstantData.restaurantImageTag}${_catalogProductProvider.selectedRestaurant['id']}',
                              child: ImageNetworkWidget(
                                imageUrl: _catalogProductProvider
                                    .selectedRestaurant['pictureId']
                                    .toString(),
                                height: double.infinity,
                                width: double.infinity,
                                indicatorHeight:
                                    SizeData.imageIndicatorHeight50,
                                indicatorWidth: SizeData.imageIndicatorWidth50,
                                errorIconSize: SizeData.imageErrorSize50,
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                          ),
                          SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                SizeData.padding25,
                                SizeData.padding8,
                                SizeData.padding25,
                                0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          size: SizeData.iconSize45,
                                          color:
                                              ColorData.black.withOpacity(0.5),
                                        ),
                                        const Icon(
                                          Icons.arrow_back,
                                          size: SizeData.iconSize25,
                                          color: ColorData.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Consumer<FavoriteRestaurantProvider>(
                                    builder: (context,
                                            favoriteRestaurantProvider, _) =>
                                        GestureDetector(
                                      onTap: () {
                                        favoriteRestaurantProvider.listOfIds
                                                .contains(
                                                    _catalogProductProvider
                                                            .selectedRestaurant[
                                                        'id'])
                                            ? favoriteRestaurantProvider
                                                .removeFromFavorite(
                                                    _catalogProductProvider
                                                        .selectedRestaurant[
                                                            'id']
                                                        .toString())
                                            : favoriteRestaurantProvider
                                                .addToFavorite(
                                                    _catalogProductProvider
                                                        .selectedRestaurant);
                                      },
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            size: SizeData.iconSize45,
                                            color: ColorData.black
                                                .withOpacity(0.5),
                                          ),
                                          Icon(
                                            favoriteRestaurantProvider.listOfIds
                                                    .contains(
                                                        _catalogProductProvider
                                                                .selectedRestaurant[
                                                            'id'])
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            size: SizeData.iconSize25,
                                            color: favoriteRestaurantProvider
                                                    .listOfIds
                                                    .contains(
                                                        _catalogProductProvider
                                                                .selectedRestaurant[
                                                            'id'])
                                                ? ColorData.redEF
                                                : ColorData.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: SizeData.padding25,
                          vertical: SizeData.padding8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                              text:
                                  '${_catalogProductProvider.selectedRestaurant['name']}',
                              color: ColorData.grey25,
                              fontSize: SizeData.fontSize26,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const ImageSvgWidget(
                                  imagePath: 'assets/icons/location_icon.svg',
                                  height: SizeData.imageHeight20,
                                  width: SizeData.imageWidth20,
                                  isNeedLoading: false,
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                CustomTextWidget(
                                  text:
                                      '${_catalogProductProvider.selectedRestaurant['city']}',
                                  color: ColorData.grey52,
                                  fontSize: SizeData.fontSize12,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomTextWidget(
                                  text:
                                      '${_catalogProductProvider.selectedRestaurant['rating']}',
                                  color: ColorData.grey52,
                                  fontSize: SizeData.fontSize12,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                const Icon(
                                  Icons.star,
                                  size: SizeData.iconSize20,
                                  color: ColorData.orangeFF,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            CustomTextWidget(
                              text:
                                  '${_catalogProductProvider.selectedRestaurant['description']}',
                              color: ColorData.grey52,
                              fontSize: SizeData.fontSize12,
                              maxLines: 7,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            const Divider(
                              color: ColorData.bgGreyED,
                              height: 1.0,
                              thickness: 2.0,
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeData.padding25,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CustomTextWidget(
                            text: TextData.textFood,
                            color: ColorData.grey25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      _listOfFoods,
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeData.padding25,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CustomTextWidget(
                            text: TextData.textBeverage,
                            color: ColorData.grey25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      _listOfBeverage,
                    ],
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
      ),
    );
  }
}
