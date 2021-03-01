import 'package:flutfood/commons/text_data.dart';
import 'package:flutfood/providers/catalog_product_provider.dart';
import 'package:flutfood/providers/favorite_restaurant_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:logger/logger.dart';
import 'package:flutfood/commons/color_data.dart';
import 'package:flutfood/commons/constant_data.dart';
import 'package:flutfood/widgets/Image_network_widget.dart';
import 'package:flutfood/widgets/custom_text_widget.dart';
import 'package:flutfood/widgets/image_svg_widget.dart';

class ListOfFavoriteRestaurantsWidget extends StatelessWidget {
  const ListOfFavoriteRestaurantsWidget({
    @required this.listOfRestaurants,
    @required this.catalogProductProvider,
    @required this.favoriteRestaurantProvider,
    Key key,
  }) : super(key: key);

  final List<dynamic> listOfRestaurants;
  final CatalogProductProvider catalogProductProvider;
  final FavoriteRestaurantProvider favoriteRestaurantProvider;

  @override
  Widget build(BuildContext context) {
    final Logger _logger = Logger();

    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      itemCount: listOfRestaurants.length ?? 0,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Slidable(
        actionPane: const SlidableDrawerActionPane(),
        secondaryActions: [
          IconSlideAction(
            caption: TextData.textDelete,
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {
              favoriteRestaurantProvider.removeFromFavorite(
                  listOfRestaurants[index]['id'].toString());
            },
          ),
        ],
        child: GestureDetector(
          onTap: () {
            catalogProductProvider.selectedRestaurant =
                listOfRestaurants[index] as Map<String, dynamic>;
            _logger.d(catalogProductProvider.selectedRestaurant);
            Navigator.pushNamed(context, ConstantData.catalogProductRoute);
          },
          child: Container(
            padding: const EdgeInsets.all(
              10.0,
            ),
            decoration: BoxDecoration(
              color: ColorData.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: ColorData.grey25.withOpacity(0.12),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag:
                      '${ConstantData.restaurantImageTag}${listOfRestaurants[index]['id']}',
                  child: ImageNetworkWidget(
                    imageUrl: listOfRestaurants[index]['pictureId'].toString(),
                    height: 90.0,
                    width: 90.0,
                    indicatorHeight: 30.0,
                    indicatorWidth: 30.0,
                    errorIconSize: 30.0,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: '${listOfRestaurants[index]['name']}',
                        color: ColorData.grey25,
                        fontSize: 16.0,
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
                            height: 20.0,
                            width: 20.0,
                            isNeedLoading: false,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          CustomTextWidget(
                            text: '${listOfRestaurants[index]['city']}',
                            color: ColorData.grey52,
                            fontSize: 12.0,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 20.0,
                            color: ColorData.orangeFF,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          CustomTextWidget(
                            text: '${listOfRestaurants[index]['rating']}',
                            color: ColorData.grey52,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 16.0,
      ),
    );
  }
}
