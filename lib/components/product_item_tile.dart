import 'package:flutter/material.dart';

class ProductItemTile extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productImage;
  final VoidCallback onPressed;

  const ProductItemTile({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(productImage, height: 100, width: 100),
            Text(
              productName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text("\$$productPrice"),
            ElevatedButton(
              onPressed: onPressed,
              child: Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
