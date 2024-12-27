import 'package:flutter/material.dart';
import 'package:homemarket/componants/appBar.dart';
import 'package:homemarket/styles/AppColors.dart';

import '../config/ProductList.dart';

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
      appBar: appBar(title: "My Cart"),
      body: Column(
        children: [
          Expanded(
            child: isAddCart || cartList.isNotEmpty
                ? Padding(
              padding: EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: cartList.length,
                itemBuilder: (context, index) {
                  final cartItem = cartList[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Item image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              cartItem['item']['imagePath'] ?? 'assets/images/default.png',
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 16),

                          // Item details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartItem['item']['title'] ?? 'Unknown',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text("Price: \$${cartItem['item']['price'] ?? '0.00'}"),
                                Text("Size: ${cartItem['selectedSize'] ?? 'N/A'}"),
                                Text("Color: ${cartItem['selectedColor'] ?? 'N/A'}"),
                                Text("Quantity: ${cartItem['quantity'] ?? 0}"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
                : Center(
              child: Text(
                "No items in cart",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // Checkout button at the bottom
          if (cartList.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle checkout action
                    print("Proceeding to checkout...");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonBackground,
                  ),
                  child: Text(
                    "Checkout",
                    style: TextStyle(fontSize: 18,color: Colors.black54),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
