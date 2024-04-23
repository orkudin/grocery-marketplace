import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_marketplace/models/card_product.dart';
import 'package:grocery_marketplace/providers/favorites_provider.dart';
import 'package:grocery_marketplace/widgets/image_slider.dart';
import 'package:transparent_image/transparent_image.dart';

class CardProductItem extends ConsumerWidget {
  const CardProductItem({
    Key? key,
    required this.product,
    required this.onSelectProduct,
    this.icon,
  }) : super(key: key);

  final CardProduct product;
  final Function(CardProduct cardProduct) onSelectProduct;
  final Icon? icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoritesProductsProvider);
    bool isFavorite = favoriteMeals.contains(product);

    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectProduct(product);
        },
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ImageSlider(
                imagesUrl: product.images,
                options: CarouselOptions(
                    enableInfiniteScroll: false,
                    height: double.infinity,
                    viewportFraction: 1),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                // color: Colors.black54,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${product.price.toStringAsFixed(2)} T",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      product.category,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: IconButton(
                              onPressed: () {
                                final wasAdded = ref
                                    .read(favoritesProductsProvider.notifier)
                                    .toggleProductFavoriteStatus(product);

                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(wasAdded
                                        ? 'Product added to cart'
                                        : 'Product removed from cart')));
                              },
                              icon: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                transitionBuilder: (child, animation) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                                child: icon ?? Icon(
                                        isFavorite
                                            ? Icons.shopping_cart
                                            : Icons.shopping_cart_outlined,
                                        key: ValueKey(isFavorite),
                                      ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  backgroundColor: icon == null ?  Colors.amber : const Color.fromARGB(255, 170, 89, 84)) ,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
