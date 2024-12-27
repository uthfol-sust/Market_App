import 'package:flutter/material.dart';
import 'package:homemarket/config/AppRoutes.dart';
import 'package:homemarket/styles/AppColors.dart';
import 'package:homemarket/styles/AppTexts.dart';

class homePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<homePage> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<Map<String, String>> _pageContents = [
    {
      'title': 'View product 360 degrees',
      'description': 'You can see the product with all angles, true and convenient',
      'imagePath': 'assets/png/home.png',
    },
    {
      'title': 'Find products easily',
      'description': 'You just need to take a photo or upload and we will find similar products for you.',
      'imagePath': 'assets/png/find_product.png',
    },
    {
      'title': 'Payment is easy',
      'description': 'You can pay with various secure and easy payment methods.',
      'imagePath': 'assets/png/sales.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
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
                          Image.asset(
                            _pageContents[index]['imagePath']!,
                            height: 250,
                          ),
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
                          ? AppColors.buttonBackground
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.loginpage);
                },
                child: Text(
                  'Get Started',
                  style: AppTexts.subText,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonBackground,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
          Positioned(
            right: 10,
            top: MediaQuery.of(context).size.height * 0.4,
            child: IconButton(
              icon: Icon(Icons.arrow_forward_ios_outlined, size: 30, color: Colors.black),
              onPressed: () {
                setState(() {
                  currentPage = (currentPage + 1) % _pageContents.length;
                });
                _pageController.animateToPage(
                  currentPage,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
