import 'package:flutter/material.dart';
import 'package:homemarket/componants/HomeItemCardBig.dart';
import 'package:homemarket/config/AppRoutes.dart';
import '../componants/DisplayCardSmall.dart';
import '../config/Appicons.dart'; // Ensure this path is correct.

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const int cardsPerRow = 2;
    final cardWidth = (screenWidth - 30) / cardsPerRow;

    // Example list of image paths for each grid item
    final List<Map<String, String>> cardData = [
      {'imagePath': 'assets/png/Gra_t_shirt.png', 'title': 'Graphic shirt', 'subtitle': 'The fine print',},
      {'imagePath': 'assets/png/kids.png', 'title': 'Summer co-orders', 'subtitle': 'Just add kicks',},
      {'imagePath': 'assets/png/sandle.png', 'title': 'Sandals', 'subtitle': 'Stay cool',},
      {'imagePath': 'assets/png/facewash.png', 'title': 'Face coverings', 'subtitle': 'Washable',},
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              HomeItemCardBig(
                height: 150,
                imagePath: Appicons.newTrend,
                title: "NEW Trend",
                subtitle: "Check out the latest trends!",
                price: null, // No price for this card
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.NewTrend);
                },
              ),
              SizedBox(height: 25),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cardsPerRow,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: cardWidth / 200,
                ),
                itemCount: cardData.length,
                itemBuilder: (context, index) {
                  return DisplayCardSmall(
                    height: 220,
                    imagePath: cardData[index]['imagePath']!,
                    title: cardData[index]['title']!,
                    subtitle: cardData[index]['subtitle'],
                    price: cardData[index]['price'],
                    onTap: () {
                      print("Card $index tapped");
                    },
                  );
                },
              ),
              SizedBox(height: 25),
              HomeItemCardBig(
                height: 150,
                imagePath: Appicons.SrippesBoy,
                title: "SRIPPES",
                subtitle: "The like kings",
                price: null, // No price for this card
                onTap: () {
                  print("SRIPPES");
                },
              ),
              SizedBox(height: 20),
              HomeItemCardBig(
                height: 150,
                imagePath: Appicons.summerHats,
                title: "SUMMER SEA",
                price: null, // No price for this card
                onTap: () {
                  print("SRIPPES");
                },
              ),

              SizedBox(height: 20,),
              Container(

              )

            ],
          ),
        ),
      ),
    );
  }
}
