import 'package:flutter/material.dart';
import 'package:product_list/core/providers/card_provider.dart';
import 'package:product_list/core/theme/app_theme.dart';
import 'package:provider/provider.dart';

import 'core/providers/product_provider.dart';
import 'feature/cart_screen/ui/cart_screen.dart';
import 'feature/products_screen/ui/products_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()..loadProducts()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Онлайн-магазин',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => ProductScreen(),
          '/cart': (context) => CartScreen(),
        },
      ),
    );
  }
}