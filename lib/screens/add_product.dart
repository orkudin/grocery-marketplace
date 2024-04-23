import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_marketplace/models/card_product.dart';
import 'package:grocery_marketplace/providers/add_product_provider.dart';
import 'package:grocery_marketplace/providers/products_provider.dart';

class AddProductScreen extends ConsumerStatefulWidget {
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends ConsumerState<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _imagesController = TextEditingController();
  String _selectedCategory = "Fruits & Berries";

  final List<String> categories = [
    "Fruits & Berries",
    "Vegetables",
    "Leafy Greens",
    "Herbs",
    "Microgreens",
    "Mushrooms",
    "Beef",
    "Pork",
    "Lamb",
    "Poultry",
    "Eggs",
    "Milk & Cream",
    "Cheese",
    "Yogurt",
    "Butter",
    "Honey",
    "Maple Syrup",
    "Jams & Preserves",
    "Bread & Pastries",
    "Flour & Grains",
    "Nuts & Seeds",
    "Dried Fruits",
    "Cider & Juice",
    "Wine & Spirits",
    "Coffee & Tea",
    "Sauces & Condiments",
    "Pickles & Ferments",
    "Salad Dressings",
    "Dips & Spreads",
    "Prepared Meals",
    "Gift Baskets",
    "Farm Merchandise"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imagesController,
                decoration:
                    InputDecoration(labelText: 'Images (comma-separated URLs)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter image URLs';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
                items: categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Category'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
// Create a new CardProduct instance with the entered data
                    CardProduct newProduct = CardProduct(
                      id: DateTime.now().millisecondsSinceEpoch,
                      title: _titleController.text,
                      description: _descriptionController.text,
                      price: double.parse(_priceController.text),
                      images: _imagesController.text.split(','),
                      category: _selectedCategory,
                    );

                    // TODO: Save the new product to your data source or perform any necessary actions
                    ref
                        .read(addProductProvider.notifier)
                        .addProduct(newProduct);

                    // Clear the form fields
                    _titleController.clear();
                    _descriptionController.clear();
                    _priceController.clear();
                    _imagesController.clear();

                    // Show a success message or navigate back to the previous screen
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Product added successfully')),
                    );

                    Navigator.pop(context);
                  }
                },
                child: Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
