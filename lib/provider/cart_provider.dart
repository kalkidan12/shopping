import 'package:flutter/cupertino.dart';
import 'package:shopping/model/cart_model.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartModel> _cartItems = {};

  Map<String, CartModel> get cartItems {
    return {..._cartItems};
  }

  int get itemCount {
    return _cartItems.length;
  }

  void reduceItem(String productId, String productTitle, double productPrice,
      int productQuantity) {
    if (productQuantity == 1) {
      _cartItems.remove(productId);
      notifyListeners();
    } else {
      _cartItems.update(
          productId.toString(),
          (cartItem) => CartModel(
              productId: productId,
              productTitle: productTitle,
              productPrice: cartItem.productPrice,
              productQuantity: cartItem.productQuantity - 1));

      notifyListeners();
    }
  }

  void addItem(String productId, String productTitle, double productPrice,
      int productQuantity) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (existingCartItem) => CartModel(
              productId: existingCartItem.productId,
              productTitle: existingCartItem.productTitle,
              productPrice: existingCartItem.productPrice,
              productQuantity: existingCartItem.productQuantity + 1));
    }

    notifyListeners();
  }

  void addToCart(String productId, String productTitle, double productPrice,
      int productQuantity) {
    _cartItems.putIfAbsent(
      productId,
      () => CartModel(
          productId: productId,
          productTitle: productTitle,
          productQuantity: 1,
          productPrice: productPrice),
    );
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.productPrice * cartItem.productQuantity;
    });

    return total;
  }

  void removeItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }
}
