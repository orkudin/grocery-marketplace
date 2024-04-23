import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_marketplace/models/card_product.dart';

class ActivePageTitleNotifier extends StateNotifier<String> {
  ActivePageTitleNotifier() : super('');

  String setActivePageTitle(String pageTitle) {
    state = pageTitle;
    return pageTitle;
  }
}

final favoritesProductsProvider =
    StateNotifierProvider<ActivePageTitleNotifier, String>((ref) {
  return ActivePageTitleNotifier();
});
