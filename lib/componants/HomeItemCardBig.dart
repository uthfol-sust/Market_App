import 'package:flutter/material.dart';

class HomeItemCardBig extends StatelessWidget {
  final double? width;
  final double height;
  final String imagePath;
  final String title; // Made non-nullable since it's required
  final String? subtitle;
  final String? price;
  final VoidCallback onTap;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final IconData? icon;

  const HomeItemCardBig({
    super.key,
    this.width,
    required this.height,
    required this.imagePath,
    required this.title,
    this.subtitle,
    this.price,
    required this.onTap,
    this.titleStyle,
    this.subtitleStyle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Title, Subtitle, and Price Section
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Title
                    Text(
                      title,
                      style: titleStyle ?? const TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Subtitle
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: subtitleStyle ??const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    // Price
                    if (price != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          "Price: \$${price!}",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            // Image Section
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: Image.asset(
                  imagePath,
                  height: height,
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
