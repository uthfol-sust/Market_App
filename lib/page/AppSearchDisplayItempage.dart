import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homemarket/componants/HomeItemCardBig.dart';
import 'package:homemarket/styles/AppColors.dart';
import 'AppSearchPage.dart';

class AppSearchDisplayItemPage extends StatefulWidget {
  @override
  _AppSearchDisplayItemPageState createState() =>
      _AppSearchDisplayItemPageState();
}

class _AppSearchDisplayItemPageState extends State<AppSearchDisplayItemPage> {
  String query = "";
  String selectedSection = "Men";
  FocusNode searchFocusNode = FocusNode();
  Map<String, List<dynamic>> itemsData = {};

  @override
  void initState() {
    super.initState();
    loadItemsData();
  }

  Future<void> loadItemsData() async {
    try {
      String jsonData = await rootBundle.loadString('assets/Json/Data.json');
      Map<String, dynamic> data = json.decode(jsonData);
      setState(() {
        itemsData = {
          "Men": List<Map<String, dynamic>>.from(data['Men']),
          "Women": List<Map<String, dynamic>>.from(data['Women']),
        };
      });
    } catch (e) {
      print("Error loading JSON data: $e");
    }
  }

  void selectSection(String section) {
    setState(() {
      selectedSection = section;
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = itemsData[selectedSection] ?? [];
    return Scaffold(
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              focusNode: searchFocusNode,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppSearchPage(),
                  ),
                );
              },
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),

          // Tabs Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () => selectSection("Men"),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Men",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (selectedSection == "Men")
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        height: 2,
                        width: 50,
                        color: AppColors.buttonBackground,
                      ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => selectSection("Women"),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Women",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (selectedSection == "Women")
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        height: 2,
                        width: 50,
                        color: AppColors.buttonBackground,
                      ),
                  ],
                ),
              ),
            ],
          ),

          // Display Items
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: EdgeInsets.all(15),
                  child: HomeItemCardBig(
                    height: 150,
                    imagePath: item['image']!,
                    title: item['name']!,
                    onTap: () {
                      print('Tapped on ${item['name']}');
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
