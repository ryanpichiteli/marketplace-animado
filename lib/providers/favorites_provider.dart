// providers/favorites_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:marketplace_animado/models/product_model.dart';

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, List<Product>>((ref) {
  return FavoritesNotifier();
});

class FavoritesNotifier extends StateNotifier<List<Product>> {
  final Box<Product> _favoritesBox = Hive.box<Product>('favorites');

  FavoritesNotifier() : super([]) {
    _loadFavorites();
  }

  void _loadFavorites() {
    state = _favoritesBox.values.toList();
  }

  void toggleFavorite(Product product) {
    if (state.any((p) => p.id == product.id)) {
      _favoritesBox.delete(product.id);
      state = state.where((p) => p.id != product.id).toList();
    } else {
      final productCopy = product.copyWith();
      _favoritesBox.put(product.id, productCopy);
      state = [...state, productCopy];
    }
  }

  bool isFavorite(String productId) {
    return state.any((product) => product.id == productId);
  }
}