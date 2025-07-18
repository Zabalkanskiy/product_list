import 'package:flutter/material.dart';
import 'package:product_list/core/models/cart.dart';
import 'package:product_list/core/models/product.dart';

class CartProvider with ChangeNotifier {
  final Cart _cart = Cart();

  Cart get cart => _cart;

  void addToCart(Product product) {
    _cart.addProduct(product);
    notifyListeners();
  }

  void clearCart() {
    _cart.items.clear();
    notifyListeners();
  }
}