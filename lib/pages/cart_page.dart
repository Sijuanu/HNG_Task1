import 'package:flutter/material.dart';
import 'order_successful.dart';

class CartPage extends StatelessWidget {
  final List<List<String>> cartItems;
  final Function(int) onRemoveItem;
  final String Function() calculateTotal;

  const CartPage({
    super.key,
    required this.cartItems,
    required this.onRemoveItem,
    required this.calculateTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                  ),
                  child: ListTile(
                    title: Text(cartItems[index][0]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("\$${cartItems[index][1]}"),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => onRemoveItem(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Total: \$${calculateTotal()}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrderSuccessPage()),
                );
              },
              child: Text("Place Order"),
            ),
          ),
        ],
      ),
    );
  }
}
