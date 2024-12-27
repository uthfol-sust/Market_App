import 'package:flutter/material.dart';

class AppAddCartPage extends StatelessWidget {
  final Map? item;
  final int? quantity;
  final String? selectedSize;
  final String? selectedColor;
  final bool isAddCart;

  AppAddCartPage({
    this.item,
    this.quantity,
    this.selectedSize,
    this.selectedColor,
    this.isAddCart = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Details"),
      ),
      body: isAddCart
          ? Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Item: ${item?['title'] ?? 'Unknown'}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Price: \$${item?['price'] ?? '0.00'}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Selected Size: ${selectedSize ?? 'N/A'}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Selected Color: ${selectedColor ?? 'N/A'}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Quantity: ${quantity ?? 0}",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      )
          : Center(
        child: Text(
          "No items in cart",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

