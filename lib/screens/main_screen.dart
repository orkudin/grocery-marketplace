import 'package:flutter/material.dart';
import 'package:grocery_marketplace/models/card_product.dart';
import 'package:grocery_marketplace/screens/product_detail_screen.dart';
import 'package:grocery_marketplace/widgets/card_product_item.dart';
import 'package:grocery_marketplace/widgets/search_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
    required this.cardProducts,
    this.title,
    this.category,
    this.cartScreen = false,
  }) ;

  final String? title;
  final String? category;
  final bool? cartScreen;
  final List<CardProduct> cardProducts;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String searchQuery = '';

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
    List<CardProduct> filteredProducts = widget.cardProducts
        .where((product) =>
            product.title.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Здесь ничего нет...',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Проверьте подключение к сети...',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
    );

    if (filteredProducts.isNotEmpty) {
      content = GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 4,
          mainAxisSpacing: 20,
        ),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) => CardProductItem(
          icon: widget.cartScreen! ? Icon(Icons.delete_outline) : null,
          product: filteredProducts[index],
          onSelectProduct: (cardProducts) {
            selectProduct(context, cardProducts);
          },
        ),
      );
    }

    return Scaffold(
      appBar: widget.title != null ? AppBar(title: Text(widget.title!)) : null,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: SearchBarWidget(
              onSearch: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(child: content),
        ],
      ),
    );
  }
}