import 'package:flutter/material.dart';
import 'package:grocery_marketplace/models/card_product.dart';
import 'package:grocery_marketplace/screens/product_detail_screen.dart';
import 'package:grocery_marketplace/widgets/card_product_item.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key,
    required this.cardProducts,
    this.title,
  });

  final String? title;
  final List<CardProduct> cardProducts;

  void selectProduct(BuildContext context, CardProduct product) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ProductDetailScreen(
          product: product,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Nothing here!',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Try selecting different category',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
    );

    if (cardProducts.isNotEmpty) {
      content = GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          // crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: cardProducts.length,
        itemBuilder: (context, index) => CardProductItem(
          product: cardProducts[index],
          onSelectProduct: (cardProducts) {
            selectProduct(context, cardProducts);
          },
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
