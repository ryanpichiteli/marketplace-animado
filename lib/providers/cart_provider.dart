// providers/cart_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:marketplace_animado/models/product_model.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<Product>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<Product>> {
  final Box<Product> _cartBox = Hive.box<Product>('cart');

  CartNotifier() : super([]) {
    _loadCart();
  }

  void _loadCart() {
    state = _cartBox.values.toList();
  }

  void addToCart(Product product) {
    if (state.any((p) => p.id == product.id)) {
      return; 
    }

    final productCopy = product.copyWith();
    _cartBox.put(product.id, productCopy);
    state = [...state, productCopy];
  }

  void removeFromCart(String productId) {
    _cartBox.delete(productId);
    state = state.where((p) => p.id != productId).toList();
  }

  double get total {
    return state.fold(0, (sum, product) => sum + product.price);
  }

  void clearCart() {
    _cartBox.clear();
    state = [];
  }
}