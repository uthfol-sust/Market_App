import 'package:flutter/material.dart';
import 'package:homemarket/config/AppRoutes.dart';
import 'dart:async';
import 'package:homemarket/styles/AppColors.dart';
import 'package:homemarket/styles/AppTexts.dart';

class homePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<homePage> {
  final PageController _pageController = PageController();
  late Timer timer;
  int currentPage = 0;

  // List of text content
  final List<Map<String, String>> _pageContents = [
    {
      'title': 'View product 360 degrees',
      'description': 'You can see the product with all angles, true and convenient',
    },
    {
      'title': 'Find products easily',
      'description': 'You just need to take a photo or upload and we will find similar products for you.',
    },
    {
      'title': 'Payment is easy',
      'description': 'You just need to take a photo or upload and we will find similar products for you.',
    },
  ];

  @override
  void initState() {
    super.initState();

    // Timer to switch pages every 3 seconds
    timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      setState(() {
        // Increment currentPage and make sure it loops back after reaching the last page
        currentPage = (currentPage + 1) % _pageContents.length;
      });
      // Ensure right-to-left animation when switching pages
      _pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    timer.cancel();  // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            // Expanded allows PageView to take up all available space
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pageContents.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Optional image: Uncomment and add your image here if needed
                         Image.asset('assets/png/home.png', height: 250),
                        SizedBox(height: 70),
                        Text(
                          _pageContents[index]['title']!,
                          style: AppTexts.subHeading,
                        ),
                        SizedBox(height: 10),
                        Text(
                          _pageContents[index]['description']!,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Custom Page Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_pageContents.length, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: currentPage == index ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? AppColors.buttonBackground // Highlight the active page
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
               Navigator.of(context).pushNamed(AppRoutes.signup);
              },
              child: Text(
                'Get Started',
                style: AppTexts.subText,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonBackground, // Dark maroon color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
