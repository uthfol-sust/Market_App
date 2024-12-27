import 'package:flutter/material.dart';

import 'DisplayCardSmall.dart';

class AppGridView extends StatelessWidget {
  final List<Map<String, String>> cardData;
  final int cardsPerRow;
  final double cardHeight;
  final double spacing;
  final double childAspectRatio;

  const AppGridView({
    super.key,
    required this.cardData,
    required this.cardsPerRow,
    required this.cardHeight ,
    required this.spacing ,
    required this.childAspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = (screenWidth - (spacing * (cardsPerRow + 1))) / cardsPerRow;
    final dynamicChildAspectRatio = cardWidth / cardHeight;

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: cardsPerRow,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
        childAspectRatio: dynamicChildAspectRatio,
      ),
      itemCount: cardData.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: cardHeight,
          child: DisplayCardSmall(
            height: cardHeight,
            imagePath: cardData[index]['imagePath']!,
            title: cardData[index]['title']!,
            subtitle: cardData[index]['subtitle'],
            price: null,
            onTap: () {
              print("Card $index tapped");
            },
          ),
        );
      },
    );
  }

}
