import 'package:flutter/material.dart';
import 'package:flutfood/commons/color_data.dart';
import 'package:flutfood/commons/constant_data.dart';
import 'package:flutfood/widgets/Image_network_widget.dart';
import 'package:flutfood/widgets/custom_text_widget.dart';

class ListOfProductsWidget extends StatelessWidget {
  const ListOfProductsWidget({
    @required this.listOfProducts,
    @required this.imageUrl,
    Key key,
  }) : super(key: key);

  final List<dynamic> listOfProducts;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(
        16.0,
      ),
      itemCount: listOfProducts.length ?? 0,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.only(
            bottom: 10.0,
          ),
          decoration: BoxDecoration(
            color: ColorData.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: ColorData.grey25.withOpacity(0.12),
                blurRadius: 6,
              ),
            ],
          ),
          child: Column(
            children: [
              Hero(
                tag: '${ConstantData.productImageTag}${listOfProducts[index]}',
                child: ImageNetworkWidget(
                  imageUrl: imageUrl,
                  height: 130.0,
                  width: double.infinity,
                  indicatorHeight: 30.0,
                  indicatorWidth: 30.0,
                  errorIconSize: 30.0,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextWidget(
                    text: listOfProducts[index]['name'].toString(),
                    color: ColorData.grey25,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
