import 'package:flutter/material.dart';
import 'package:product_list/core/models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  // Загрузка продуктов (в реальном приложении здесь будет API-запрос)
  Future<void> loadProducts() async {

    // Заполняем список продуктов
    _products = [
      Product(
        id: '1',
        name: 'Смартфон XYZ',
        price: 29999.99,
        imageUrl: 'https://placehold.co/150/png',
      ),
      Product(
        id: '2',
        name: 'Ноутбук Pro',
        price: 89999.99,
        imageUrl: 'https://placehold.co/150/png',
      ),
      Product(
        id: '3',
        name: 'Наушники Premium',
        price: 12999.99,
        imageUrl: 'https://placehold.co/150/png',
      ),
      Product(
        id: '4',
        name: 'Умные часы',
        price: 19999.99,
        imageUrl: 'https://placehold.co/150/png',
      ),
    ];

    notifyListeners();
  }
}