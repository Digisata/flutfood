import 'package:flutfood/commons/constant_data.dart';
import 'package:flutfood/providers/app_provider.dart';
import 'package:flutfood/providers/catalog_product_provider.dart';
import 'package:flutfood/providers/favorite_restaurant_provider.dart';
import 'package:flutfood/providers/home_provider.dart';
import 'package:flutfood/providers/landing_provider.dart';
import 'package:flutfood/routes/landing_route.dart';
import 'package:flutfood/routes/splash_route.dart';
import 'package:flutfood/routes/stack/home/catalog_product_route.dart';
import 'package:flutfood/routes/stack/home/favorite_restaurant_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppProvider>(
          create: (context) => AppProvider(),
        ),
        ChangeNotifierProvider<LandingProvider>(
          create: (context) => LandingProvider(),
        ),
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<CatalogProductProvider>(
          create: (context) => CatalogProductProvider(),
        ),
        ChangeNotifierProvider<FavoriteRestaurantProvider>(
          create: (context) => FavoriteRestaurantProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ConstantData.projectTitle,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      initialRoute: ConstantData.initialRoute,
      routes: <String, WidgetBuilder>{
        ConstantData.initialRoute: (context) => SplashRoute(),
        ConstantData.landingRoute: (context) => LandingRoute(),
        ConstantData.catalogProductRoute: (context) => CatalogProductRoute(),
        ConstantData.favoriteRestaurantRoute: (context) =>
            FavoriteRestaurantRoute(),
      },
    );
  }
}
