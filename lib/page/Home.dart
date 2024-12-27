import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homemarket/componants/FavoriteItemIcon.dart';
import 'package:homemarket/componants/HomeItemCardBig.dart';
import 'package:homemarket/config/AppRoutes.dart';
import '../componants/AppGridView.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Map<String, dynamic>> _data;

  Future<Map<String, dynamic>> loadJsonData() async {
    final String response = await rootBundle.loadString(
        'assets/Json/HomeData.json');
    return jsonDecode(response);
  }

  List<Map<String, String>> _convertToStringMapList(List<dynamic> data) {
    return data.map((item) {
      return {
        "imagePath": item["imagePath"]?.toString() ?? "",
        "title": item["title"]?.toString() ?? "No Title",
        "subtitle": item["subtitle"]?.toString() ?? "No Subtitle",
      };
    }).toList();
  }


  @override
  void initState() {
    super.initState();
    _data = loadJsonData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            final List<Map<String, String>> cardData = _convertToStringMapList(data['cardData']);
            final List<Map<String, String>> recentlyViewed = _convertToStringMapList(data['recentlyViewed']);
            final List<dynamic> savedItems = data['savedItems'];
            final List<dynamic> shoppingHabitsStyles = data['shoppingHabitsStyles'];
            final List<String> brands = List<String>.from(data['brands']);

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Big Card
                    HomeItemCardBig(
                      height: 150,
                      imagePath: data['bigCard']['imagePath'] ?? '',
                      title: data['bigCard']['title'] ?? 'No Title',
                      subtitle: data['bigCard']['subtitle'] ?? 'No Subtitle',
                      price: null,
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.NewTrend);
                      },
                    ),
                    SizedBox(height: 25),

                    // Main Grid View
                    AppGridView(
                      cardData: cardData,
                      cardsPerRow: 2,
                      cardHeight: 150,
                      spacing: 15,
                      childAspectRatio: 1 / 1.2,
                    ),
                    SizedBox(height: 29),

                    // Recently Viewed Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Recently Viewed",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                  Icons.dangerous_outlined, color: Colors.red),
                            ),
                          ],
                        ),
                        AppGridView(
                          cardData: recentlyViewed.cast<Map<String, String>>(),
                          cardsPerRow: 2,
                          cardHeight: 150,
                          spacing: 15,
                          childAspectRatio: 1 / 1.2,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Saved Items Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Saved Items",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                // Handle "View All"
                              },
                              child: Text("View All",
                                  style: TextStyle(color: Colors.amber)),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Column(
                          children: savedItems.map((item) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.grey.shade300, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: EdgeInsets.only(bottom: 10),
                              child: ListTile(
                                leading: Image.asset(item['imagePath']),
                                title: Text(item['title'], style: TextStyle(
                                    fontWeight: FontWeight.bold)),
                                subtitle: Text(item['price'].toString()),
                                // Convert price to string
                                trailing: Icon(Icons.arrow_forward_ios_outlined,
                                    color: Colors.grey),
                                onTap: () {
                                  print("Tapped on ${item['title']}");
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Brands You May Like
                    Text(
                      "Brands You May Like",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: brands.map((brand) {
                        return Chip(
                          label: Text(brand, style: TextStyle(fontSize: 14)),
                          backgroundColor: Colors.grey[200],
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),

                    // Styles Based on Shopping Habits
                    Text(
                      "Styles Based on Your Shopping Habits",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: shoppingHabitsStyles.length,
                      itemBuilder: (context, index) {
                        final item = shoppingHabitsStyles[index];
                        bool isFavorite = item['isFavorite'] ?? false;

                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 5,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  item['imagePath'],
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 5),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        item['title'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Price: ${item['price']}",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Spacer(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          FavoriteItemIcon(
                                            isFavorite: isFavorite,
                                            onToggle: () {
                                              setState(() {
                                                shoppingHabitsStyles[index]['isFavorite'] =
                                                !isFavorite;
                                              });
                                            },
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              print("Disliked!");
                                            },
                                            icon: Icon(
                                                Icons.thumb_down, size: 20),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}


