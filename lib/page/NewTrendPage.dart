import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homemarket/componants/appBar.dart';
import '../componants/DisplayCardSmall.dart';
import '../componants/FavoriteItemIcon.dart';
import '../config/ProductList.dart';

class NewTrendPage extends StatefulWidget {
  const NewTrendPage({super.key});

  @override
  State<NewTrendPage> createState() => _NewTrendPageState();
}

class _NewTrendPageState extends State<NewTrendPage> {
  final ValueNotifier<List<dynamic>> favoriteItemsNotifier = ValueNotifier([]);

  @override
  void initState() {
    super.initState();
    favoriteItemsNotifier.value = favoriteItems; // Initialize with existing favorites.
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    const int cardsPerRow = 2;
    final double cardWidth = screenWidth / cardsPerRow - 20;

    return Scaffold(
      appBar: appBar(title: "New Trend"),
      body: FutureBuilder<List<dynamic>>(
        future: loadNewTrends(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No data available"));
          } else {
            final trends = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.only(top: 15,bottom: 30),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cardsPerRow,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: cardWidth / 200,
                ),
                itemCount: trends.length,
                itemBuilder: (context, index) {
                  final item = trends[index];
                  return ValueListenableBuilder<List<dynamic>>(
                    valueListenable: favoriteItemsNotifier,
                    builder: (context, favoriteItems, child) {
                      final isFavorite = favoriteItems.any((favItem) => favItem['id'] == item['id']);

                      return DisplayCardSmall(
                        height: 200,
                        imagePath: item['imagePath'] ?? 'assets/images/default.png',
                        title: item['title'] ?? 'No Title',
                        subtitle: item['subtitle'],
                        price: item['price'],
                        onTap: () {},
                        trailing: FavoriteItemIcon(
                          isFavorite: isFavorite,
                          onToggle: () {
                            toggleFavorite(item);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  void toggleFavorite(dynamic item) {
    final currentFavorites = favoriteItemsNotifier.value;
    final existingIndex = currentFavorites.indexWhere((favItem) => favItem['id'] == item['id']);
    if (existingIndex != -1) {
      currentFavorites.removeAt(existingIndex);
    } else {
      currentFavorites.add(item);
    }
    favoriteItemsNotifier.value = List.from(currentFavorites);
  }

  Future<List<dynamic>> loadNewTrends() async {
    try {
      String jsonString = await rootBundle.loadString('assets/Json/itemList.json');
      List<dynamic> jsonData = jsonDecode(jsonString);
      print("Loaded JSON Data: $jsonData");
      return jsonData;
    } catch (e) {
      print("Error loading JSON: $e");
      return [];
    }
  }
}
