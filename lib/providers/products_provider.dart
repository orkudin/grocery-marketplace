import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_marketplace/products.dart';

final cardProductsProvider = Provider((ref){
  return dummyCardProductsList;
});