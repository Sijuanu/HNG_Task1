import 'package:flutter/material.dart';

import '../components/product_item_tile.dart';
import '../model/cart_model.dart';
import 'cart_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CartModel cartModel = CartModel();

  void _addItemToCart(int index) {
    setState(() {
      cartModel.addItemToCart(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added to cart'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _removeItemFromCart(int index) {
    setState(() {
      cartModel.removeItemFromCart(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Removed from cart'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "MyShopping",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            height: 70,
            decoration: BoxDecoration(
              color: Colors.purple.shade100,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.purple,
                ),
                hintText: "Search for any Product",
                border: InputBorder.none,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: cartModel.shopItems.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.2,
              ),
              itemBuilder: (context, index) {
                return ProductItemTile(
                  productName: cartModel.shopItems[index][0],
                  productPrice: cartModel.shopItems[index][1],
                  productImage: cartModel.shopItems[index][2],
                  onPressed: () => _addItemToCart(index),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade300,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              icon: const Icon(Icons.home),
            ),
            label: "Product",
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(
                      cartItems: cartModel.cartItems,
                      onRemoveItem: _removeItemFromCart,
                      calculateTotal: cartModel.calculateTotal,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart),
            ),
            label: "Checkout",
          ),
        ],
      ),
    );
  }
}
