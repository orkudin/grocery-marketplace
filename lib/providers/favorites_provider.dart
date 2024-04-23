import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_marketplace/models/card_product.dart';

class FavoriteProductsNotifier extends StateNotifier<List<CardProduct>> {
  FavoriteProductsNotifier() : super([]);

  bool toggleProductFavoriteStatus(CardProduct carProduct) {
    final productIsFavorite = state.contains(carProduct);

    if (productIsFavorite) {
      state = state.where((m) => m.id != carProduct.id).toList();
      return false;
    } else {
      state = [...state, carProduct];
      return true;
    }
  }
}

final favoritesProductsProvider =
    StateNotifierProvider<FavoriteProductsNotifier, List<CardProduct>>((ref) {
  return FavoriteProductsNotifier();
});
