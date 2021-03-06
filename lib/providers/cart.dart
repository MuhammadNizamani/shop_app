import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _item = {};
  Map<String, CartItem> get item {
    return {..._item};
  }

  double get totalAmount {
    var totel = 0.0;
    _item.forEach((key, cartItem) {
      totel += cartItem.price * cartItem.quantity;
    });
    return totel;
  }

  void addCart(String productId, double price, String title) {
    if (_item.containsKey(productId)) {
      _item.update(
          productId,
          (exitingCartItem) => CartItem(
              id: exitingCartItem.id,
              title: exitingCartItem.title,
              quantity: exitingCartItem.quantity + 1,
              price: exitingCartItem.price));
    } else {
      _item.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price));
    }
    notifyListeners();
  }

  int get itemCount {
    return _item.length;
  }

  void removeItem(String productId) {
    _item.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_item.containsKey(productId)) {
      return;
    }

    if (_item[productId].quantity > 1) {
      _item.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity - 1,
              price: existingCartItem.price));
    } else {
      _item.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _item = {};
    notifyListeners();
  }
}
