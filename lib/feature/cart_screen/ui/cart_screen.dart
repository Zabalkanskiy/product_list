import 'package:flutter/material.dart';
import 'package:product_list/core/providers/card_provider.dart';
import 'package:product_list/core/theme/app_theme.dart';
import 'package:provider/provider.dart';

import '../../../core/models/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Ваша корзина'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: cartProvider.clearCart,
          ),
        ],
      ),
      body: cartProvider.cart.items.isEmpty
          ? Center(child: Text('Корзина пуста'))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.cart.items.length,
              itemBuilder: (context, index) => _buildCartItem(
                context,
                cartProvider.cart.items[index],
                theme
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Итого: ${cartProvider.cart.totalPrice.toStringAsFixed(2)} ₽',
              style: theme.textTheme.titleLarge
            ),
          ),
        ],
      ),
    );
  }
  //
  // Widget _buildCartItem(BuildContext context, CartItem cartItem, ThemeData  theme) {
  //   return Container(
  //     color: theme.extension<AppColors>()!.cardBackground, // Используем цвет из темы
  //     padding:  EdgeInsets.symmetric( horizontal: 16),
  //     margin: const EdgeInsets.symmetric(vertical: 4.0),
  //     child: ListTile(
  //       leading: Image.network(
  //         cartItem.product.imageUrl,
  //         width: 50,
  //         height: 50,
  //         fit: BoxFit.cover,
  //       ),
  //       title: Text(cartItem.product.name),
  //       subtitle: Text('${cartItem.product.price.toStringAsFixed(2)} ₽ × ${cartItem.quantity}'),
  //       trailing: Text(
  //         '${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)} ₽',
  //         style: theme.textTheme.titleMedium
  //       ),
  //     ),
  //   );
  // }

  Widget _buildCartItem(
      BuildContext context,
      CartItem cartItem,
      ThemeData theme,

      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 2, // Высота тени (выпуклость)
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Закругленные углы
        ),
        margin: const EdgeInsets.symmetric(vertical: 6.0), // Отступ между карточками
        color: theme.extension<AppColors>()!.cardBackground,
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Внутренний отступ
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.network(
                cartItem.product.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 50,
                    height: 50,
                    color: theme.extension<AppColors>()!.cardBackground.withValues(alpha: 0.3),
                    child: const Icon(Icons.image_not_supported),
                  );
                },
              ),
            ),
            title: Text(
              cartItem.product.name,
              style: theme.textTheme.titleMedium,
            ),
            subtitle: Text(
              '${cartItem.product.price.toStringAsFixed(2)} ₽ × ${cartItem.quantity}',
              style: theme.textTheme.bodyMedium,
            ),
            trailing: Text(
              '${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)} ₽',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}