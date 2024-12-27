import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homemarket/config/Appicons.dart';
import 'package:homemarket/page/AppAddCartPage.dart';
import 'package:homemarket/page/AppSearchDisplayItempage.dart';
import 'package:homemarket/page/AppSearchPage.dart';
import 'package:homemarket/page/FavoritePage.dart';
import 'package:homemarket/page/Home.dart';
import 'package:homemarket/page/profilePage.dart';

enum Menus {
  home,
  favor,
  cart,
  search,
  user,
}

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _MainPageState();
}

class _MainPageState extends State<mainPage> {
  Menus currentIndex = Menus.home;

  // Map each menu to its corresponding page
  final Map<Menus, Widget> pages = {
    Menus.home: Home(),
    Menus.search: AppSearchDisplayItemPage(),
    Menus.cart: AppAddCartPage(),
    Menus.favor: const FavoritePage() ,
    Menus.user: const profilePage(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex]!,
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  final Menus currentIndex;
  final ValueChanged<Menus> onTap;

  const MyBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white, // Box color
        borderRadius: BorderRadius.all(Radius.circular(6)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            IconButton(
              onPressed: () => onTap(Menus.home),
              icon: SvgPicture.asset(
                Appicons.homeIcon,
                color: currentIndex == Menus.home ? Colors.amber[800] : Colors.grey,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () => onTap(Menus.search),
              icon: SvgPicture.asset(
                Appicons.searchIcon,
                color: currentIndex == Menus.search ? Colors.amber[800] : Colors.grey,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () => onTap(Menus.cart),
              icon: SvgPicture.asset(
                Appicons.cartIcon,
                color: currentIndex == Menus.cart ?
                                      Colors.amber[800]
                                      : Colors.grey,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () => onTap(Menus.favor),
              icon: SvgPicture.asset(
                Appicons.favorIcon,
                color: currentIndex == Menus.favor ? Colors.amber[800] : Colors.grey,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () => onTap(Menus.user),
              icon: SvgPicture.asset(
                Appicons.userIcon,
                width: 30,
                height: 30,
                color: currentIndex == Menus.user ? Colors.amber[800] : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
