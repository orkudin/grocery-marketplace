import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_marketplace/providers/favorites_provider.dart';
import 'package:grocery_marketplace/providers/products_provider.dart';
import 'package:grocery_marketplace/screens/category_screen.dart';
import 'package:grocery_marketplace/screens/main_screen.dart';
import 'package:grocery_marketplace/screens/profile_screen.dart';

// const kInitialfilters = {
//   Filter.glutenFree: false,
//   Filter.lactosefree: false,
//   Filter.vegetarian: false,
//   Filter.vegan: false,
// };

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  // void _setScreen(String identifier) async {
  //   Navigator.of(context).pop();
  //   if (identifier == 'filters') {
  //     await Navigator.of(context).push<Map<Filter, bool>>(
  //         MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(cardProductsProvider);
    var activePageTitle = 'Grocery Marketplace';

    Widget activePage = MainScreen(
      cardProducts: availableMeals,
    );

    if (_selectedPageIndex == 1) {
      activePage = const CategoryScreen();
      activePageTitle = 'Category';
    }

    if (_selectedPageIndex == 2) {
      final favoriteMeals = ref.watch(favoritesProductsProvider);
      // activePageTitle = 'Your Favorites';
      activePageTitle = 'Cart';
      activePage = MainScreen(cartScreen: true, cardProducts: favoriteMeals);
    }

    if (_selectedPageIndex == 3) {
      activePage = ProfileScreen();
      activePageTitle = 'Profile Screen';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Main'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          // BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}
