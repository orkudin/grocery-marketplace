import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_marketplace/models/card_product.dart';
import 'package:grocery_marketplace/providers/favorites_provider.dart';
import 'package:grocery_marketplace/screens/review_screen/review_screen.dart';
import 'package:grocery_marketplace/widgets/image_slider.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductDetailScreen extends ConsumerWidget {
  const ProductDetailScreen({super.key, required this.product});

  final CardProduct product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteProducts = ref.watch(favoritesProductsProvider);
    bool isFavorite = favoriteProducts.contains(product);

    return Scaffold(
      appBar: AppBar(
        // title: Text(product.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoritesProductsProvider.notifier)
                  .toggleProductFavoriteStatus(product);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(wasAdded
                      ? 'Продукт добавлен в избранное'
                      : 'Продукт удалён из избранного')));
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                    turns: Tween<double>(begin: 0.5, end: 1).animate(animation),
                    child: child);
              },
              child: Icon(
                isFavorite ? Icons.star : Icons.star_outline_outlined,
                key: ValueKey(isFavorite),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlider(
                imagesUrl: product.images,
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  height: 300.0,
                  viewportFraction: 1,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${product.title}',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Text(
                        'код товара: 123456789',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    '${product.price} T',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star_outline),
                      Expanded(
                        child: Text('4.7'),
                      ),
                      ElevatedButton(
                        child: Text('233 отзывов'),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ReviewScreen(),
                          ));
                        },
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Common characteristics',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Description',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              Text(
                product.description,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
