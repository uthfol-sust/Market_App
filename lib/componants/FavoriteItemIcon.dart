import 'package:flutter/material.dart';

class FavoriteItemIcon extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onToggle;

  const FavoriteItemIcon({
    Key? key,
    required this.isFavorite,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : null,
      ),
    );
  }
}
