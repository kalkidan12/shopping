import 'package:flutter/cupertino.dart';
import 'package:shopping/model/cart_model.dart';
import 'package:shopping/model/favorite_model.dart';

class FavoriteProvider with ChangeNotifier {
  Map<String, FavoriteModel> _favoriteItems = {};

  Map<String, FavoriteModel> get favoriteItems {
    return {..._favoriteItems};
  }

  int get itemCount {
    return _favoriteItems.length;
  }

  void addToFavorite(String productId, String productTitle,
      String productDescription, double productPrice, String productImage) {
    _favoriteItems.putIfAbsent(
      productId,
      () => FavoriteModel(
          productId: productId,
          productTitle: productTitle,
          productDescription: productDescription,
          productPrice: productPrice,
          productImage: productImage),
    );
    notifyListeners();
  }

  void removeItem(String productId) {
    _favoriteItems.remove(productId);
    notifyListeners();
  }

  bool isFavoredItem(String productId) {
    return _favoriteItems.containsKey(productId);
    // notifyListeners();
  }
}
