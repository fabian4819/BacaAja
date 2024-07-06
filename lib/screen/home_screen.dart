// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: GoogleFonts.ubuntu(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(10, 40, 116, 1)),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Add logout functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SearchBar(),
          CategoryFilter(),
          Expanded(child: ProductList()),
          AddProductButton(),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search products...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}

class CategoryFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        hint: Text('Select category'),
        items: <String>['All', 'Fiction', 'Non-Fiction', 'Science', 'History']
            .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Replace with the actual product count
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Product $index'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductDetailScreen()),
            );
          },
        );
      },
    );
  }
}

class AddProductButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddProductScreen()),
        );
      },
      child: Icon(Icons.add),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Center(child: Text('Product Details Here')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditProductScreen()),
          );
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}

class AddProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Product ID'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Product Description'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Product Price'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Product Category'),
            ),
            ElevatedButton(
              onPressed: () {
                // Save product to Firebase
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Product Description'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Product Price'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Product Category'),
            ),
            ElevatedButton(
              onPressed: () {
                // Update product in Firebase
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
