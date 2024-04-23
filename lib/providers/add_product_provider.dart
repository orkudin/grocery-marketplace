import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_marketplace/models/card_product.dart';
import 'package:grocery_marketplace/products.dart';

class AddProductNotifier extends StateNotifier<List<CardProduct>> {
  AddProductNotifier() : super(const []);

  void addProduct(CardProduct cardProduct) {
    state = [cardProduct, ...state];
    dummyCardProductsList.add(cardProduct);
  }
}

final addProductProvider =
    StateNotifierProvider<AddProductNotifier, List<CardProduct>>(
        (ref) => AddProductNotifier());
