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
  Map<String, CartItem> _item;
  Map<String, CartItem> get item {
    return {..._item};
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
  }
}
