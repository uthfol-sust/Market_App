import 'package:flutter/material.dart';
import '../styles/AppColors.dart';
import '../styles/AppTexts.dart';

class appBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  appBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      title: Text(
        title,
        style: AppTexts.hader1,
      ),
      centerTitle: true,
      elevation: 1,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(64);
}
