import 'package:flutter/material.dart';
import '../config/ProductList.dart';
import 'ItemDetailPage.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 15),
          const Center(
            child: Text(
              "My Favorites",
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
          ),
          Divider(color: Colors.brown,),
          SizedBox(height: 15),
          Expanded(
            child: favoriteItems.isEmpty
                ? const Center(child: Text("No favorite items"))
                : ListView.builder(
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                final item = favoriteItems[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: Image.asset(
                      item['imagePath'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      item['title'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("Price: \$${item['price']}"),
                    trailing: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "See more",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black45,
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ItemDetailPage(item: favoriteItems[index]),
                        ),
                      );
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
