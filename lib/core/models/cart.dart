import 'package:product_list/core/models/cart_item.dart';
import 'package:product_list/core/models/product.dart';

class Cart {
final List<CartItem> items = [];

void addProduct(Product product) {
  final existingIndex = items.indexWhere((item) => item.product.id == product.id);
  if (existingIndex >= 0) {
    items[existingIndex].quantity++;
  } else {
    items.add(CartItem(product: product));
  }
}

double get totalPrice {
  return items.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
}
}