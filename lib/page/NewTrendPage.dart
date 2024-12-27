import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homemarket/componants/appBar.dart';
import '../componants/DisplayCardSmall.dart';
import '../componants/FavoriteItemIcon.dart';
import '../config/ProductList.dart';
import '../styles/AppColors.dart';

class NewTrendPage extends StatefulWidget {
  const NewTrendPage({super.key});

  @override
  State<NewTrendPage> createState() => _NewTrendPageState();
}

class _NewTrendPageState extends State<NewTrendPage> {
  final ValueNotifier<List<dynamic>> favoriteItemsNotifier = ValueNotifier([]);
  List<dynamic> allTrends = [];
  List<dynamic> filteredTrends = [];

  @override
  void initState() {
    super.initState();
    favoriteItemsNotifier.value = favoriteItems;
    loadNewTrends().then((data) {
      setState(() {
        allTrends = data;
        filteredTrends = List.from(allTrends);
      });
    });
  }

  void sortTrends(String sortBy) {
    setState(() {
      if (sortBy == 'highToLow') {
        filteredTrends.sort((a, b) {
          final priceA = _parsePrice(a['price']);
          final priceB = _parsePrice(b['price']);
          return priceB.compareTo(priceA);
        });
      } else if (sortBy == 'lowToHigh') {
        filteredTrends.sort((a, b) {
          final priceA = _parsePrice(a['price']);
          final priceB = _parsePrice(b['price']);
          return priceA.compareTo(priceB);
        });
      }
    });
  }

  num _parsePrice(String price) {
    return num.tryParse(price.replaceAll(RegExp(r'[^\d.]'), '') ?? '0') ?? 0;
  }

  void filterTrends(String category) {
    setState(() {
      if (category == 'All') {
        filteredTrends = List.from(allTrends);
      } else {
        filteredTrends = allTrends.where((item) => item['category'] == category).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    const int cardsPerRow = 2;
    final double cardWidth = screenWidth / cardsPerRow - 20;

    return Scaffold(
      appBar: appBar(title: "New Trend"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () => showSortDialog(context),
                  icon: const Icon(
                      Icons.sort,
                      color: AppColors.buttonBackground,
                  ),
                  label: const Text("Sort",style: TextStyle(color: AppColors.buttonBackground),),
                ),
                ElevatedButton.icon(
                  onPressed: () => showFilterDialog(context),
                  icon: const Icon(
                    Icons.filter_list,
                    color:AppColors.buttonBackground),
                  label: const Text("Filter",style: TextStyle(color: AppColors.buttonBackground)),
                ),
              ],
            ),
          ),
          Expanded(
            child: filteredTrends.isEmpty
                ? const Center(child: Text("No items to display"))
                : Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 30),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cardsPerRow,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: cardWidth / 200,
                ),
                itemCount: filteredTrends.length,
                itemBuilder: (context, index) {
                  final item = filteredTrends[index];
                  return ValueListenableBuilder<List<dynamic>>(
                    valueListenable: favoriteItemsNotifier,
                    builder: (context, favoriteItems, child) {
                      final isFavorite = favoriteItems.any((favItem) => favItem['id'] == item['id']);

                      return DisplayCardSmall(
                        height: 200,
                        imagePath: item['imagePath'],
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
            ),
          ),
        ],
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
      return jsonData;
    } catch (e) {
      print("Error loading JSON: $e");
      return [];
    }
  }

  void showSortDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text("Sort By"),
          children: [
            SimpleDialogOption(
              onPressed: () {
                sortTrends('highToLow');
                Navigator.pop(context);
              },
              child: const Text("Price: High to Low"),
            ),
            SimpleDialogOption(
              onPressed: () {
                sortTrends('lowToHigh');
                Navigator.pop(context);
              },
              child: const Text("Price: Low to High"),
            ),
          ],
        );
      },
    );
  }

  void showFilterDialog(BuildContext context) {
    final List<String> categories = [
      'All',
      'NEW IN',
      'CLOTHING',
      'SHOES',
      'ACCESSORIES',
      'FASHION',
      'SPORTSWEAR',
      'BOOKS AND MAGAZINES'
    ];
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text("Filter By Category"),
          children: categories
              .map(
                (category) => SimpleDialogOption(
              onPressed: () {
                filterTrends(category);
                Navigator.pop(context);
              },
              child: Text(category),
            ),
          )
              .toList(),
        );
      },
    );
  }
}
