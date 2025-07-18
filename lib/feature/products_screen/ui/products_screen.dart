import 'package:flutter/material.dart';
import 'package:product_list/core/models/product.dart';
import 'package:product_list/core/providers/card_provider.dart';
import 'package:product_list/core/providers/product_provider.dart';
import 'package:product_list/core/theme/app_theme.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () => Navigator.pop(context),
        // ),
        title: Text('Добавьте в заказ'),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              final totalItems = cartProvider.cart.items.fold<int>(
                  0, (sum, item) => sum + item.quantity);

              return Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () => Navigator.pushNamed(context, '/cart'),
                  ),
                  if (totalItems > 0)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: theme.extension<AppColors>()!.bageColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          totalItems.toString(),
                          style: theme.textTheme.labelSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) {
          if (productProvider.products.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: productProvider.products.length,
            itemBuilder: (context, index) => _buildProductCard(
                context,
                productProvider.products[index],
                theme
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Product product, ThemeData theme,) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      color:  theme.extension<AppColors>()!.cardBackground,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image.network(
              product.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: theme.textTheme.titleMedium
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${product.price.toStringAsFixed(2)} ₽',
                    style: theme.textTheme.bodyMedium
                  ),
                ],
              ),
            ),
            Consumer<CartProvider>(
              builder: (context, cartProvider, child) => IconButton(
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () => cartProvider.addToCart(product),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
