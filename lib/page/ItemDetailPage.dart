import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homemarket/componants/appBar.dart';
import 'package:homemarket/config/Appicons.dart';

import 'AppAddCartPage.dart';

class ItemDetailPage extends StatefulWidget {
  final Map item;

  ItemDetailPage({super.key, required this.item});

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  String selectedSize = "M";
  String selectedColor = "Black";
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Product Details"),
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 40, right: 40),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.all(Radius.circular(6)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(widget.item['imagePath'], width: 150, height: 150),
              SizedBox(height: 10),
              Text(
                widget.item['title'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "Price: \$${widget.item['price']}",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),

              // Dropdown for Size
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Size:", style: TextStyle(fontSize: 16)),
                  DropdownButton<String>(
                    value: selectedSize,
                    items: ["S", "M", "L", "XL","XXl"].map((size) => DropdownMenuItem(
                      value: size,
                      child: Text(size),
                    )).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedSize = value!;
                      });
                    },
                  ),
                ],
              ),

              // Dropdown for Color
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Color:", style: TextStyle(fontSize: 16)),
                  DropdownButton<String>(
                    value: selectedColor,
                    items: ["Black", "White", "Red", "Blue"].map((color) => DropdownMenuItem(
                      value: color,
                      child: Text(color),
                    )).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedColor = value!;
                      });
                    },
                  ),
                ],
              ),

              // Quantity Selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Quantity:", style: TextStyle(fontSize: 16)),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Text(
                        "$quantity",
                        style: TextStyle(fontSize: 16),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Add to Cart Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppAddCartPage(
                        item: widget.item,
                        quantity: quantity,
                        selectedSize: selectedSize,
                        selectedColor: selectedColor,
                        isAddCart: true,
                      ),
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      Appicons.cartIcon,
                      width: 24,
                      height: 24,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 8),
                    Text("Add to Cart"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
