import 'package:cardealership/models/item.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final List<Item> _cartItems = [];

  List<Item> get cartItems => _cartItems;

  void addItem(Item item) {
    if (!isOnTheCart(item)) {
      _cartItems.add(item);
    } else {
      _cartItems.remove(item);
    }
    update();
  }

  void removeItem(Item item) {
    _cartItems.remove(item);
    update();
  }

  bool isOnTheCart(Item item) {
    return cartItems.contains(item);
  }

  int itemCount() {
    return _cartItems.length;
  }

  double getTotalPrice() {
    double totalPrice = 0;

    for (var item in _cartItems) {
      totalPrice += item.price;
    }

    return totalPrice;
  }
}
