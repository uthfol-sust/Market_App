import 'package:flutter/material.dart';
import 'package:homemarket/config/AppRoutes.dart';
import 'package:homemarket/styles/AppColors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute:AppRoutes.homepage,
        routes: AppRoutes.pages
    );
  }
}