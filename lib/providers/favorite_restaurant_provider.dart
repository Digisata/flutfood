import 'package:flutter/foundation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FavoriteRestaurantProvider with ChangeNotifier {
  final RefreshController refreshController = RefreshController();
  List<dynamic> listOfFavoriteRestaurant = [];
  List<String> listOfIds = [];

  void addToFavorite(Map<String, dynamic> value) {
    listOfFavoriteRestaurant.add(value);
    listOfIds.add(value['id'].toString());
    notifyListeners();
  }

  void removeFromFavorite(String id) {
    listOfFavoriteRestaurant.removeWhere((element) => element['id'] == id);
    listOfIds.remove(id);
    notifyListeners();
  }
}
