import 'package:flutter/material.dart';
import 'package:grocery_marketplace/screens/add_product.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text('Edit Profile'),
                    trailing: Icon(Icons.edit),
                    onTap: () {
                      // Обработчик нажатия на "Edit Profile"
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Username: John Doe'),
                        SizedBox(height: 8.0),
                        Text('Email: john.doe@example.com'),
                        SizedBox(height: 8.0),
                        Text('Phone: +1 123-456-7890'),
                        SizedBox(height: 8.0),
                        Text('Location: New York, USA'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ListTile(
                title: Text('Choose Language'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  // Обработчик нажатия на "Choose Language"
                },
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ListTile(
                title: Text('Orders'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrdersScreen()),
                  );
                },
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ListTile(
                title: Text('Become a Seller'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BeASellerScreen()),
                  );
                },
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ListTile(
                title: Text('Add Product'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddProductScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: Center(
        child: Text('Orders Screen'),
      ),
    );
  }
}

class BeASellerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Become a Seller'),
      ),
      body: Center(
        child: Text('Become a Seller Screen'),
      ),
    );
  }
}
