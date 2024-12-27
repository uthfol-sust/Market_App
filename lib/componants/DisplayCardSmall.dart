import 'package:flutter/material.dart';

class DisplayCardSmall extends StatelessWidget {
  final double height;
  final String imagePath;
  final String title;
  final String? subtitle;
  final String? price;
  final VoidCallback? onTap;
  final Widget? trailing;

  const DisplayCardSmall({
    super.key,
    required this.height,
    required this.imagePath,
    required this.title,
    this.subtitle,
    this.price,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Ensure full width for children
          children: [
            // Image at the top
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                imagePath,
                height: height * 0.5,
                width: height*0.5,

              ),
            ),
            // Column with text and favorite icon
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  if (price != null)
                    Text(
                      "Price: \$${price!}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  const SizedBox(height: 10),
                  if (trailing != null)
                    Align(
                      alignment: Alignment.centerRight, // Align trailing to the right
                      child: trailing!,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
