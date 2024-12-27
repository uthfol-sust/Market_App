import 'package:flutter/material.dart';

class AppCardItem extends StatelessWidget {
  final IconData? icon;
  final String title;
  final VoidCallback onTap;
  final String? subtitle;

  const AppCardItem({super.key, this.icon, required this.title, required this.onTap, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      color: Colors.brown,
                    ),
                    const SizedBox(width: 12), // Spacing between icon and title
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                if (subtitle != null && subtitle!.isNotEmpty)
                  Positioned(
                    right: 15,
                    child: Text(
                      subtitle!,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
