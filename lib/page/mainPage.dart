import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homemarket/config/AppIcons.dart';
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
    Menus.home: const Center(
      child: Text(
        "This is main home page",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
    Menus.search: const Center(
      child: Text(
        "This is Search page",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
    Menus.cart: const Center(
      child: Text(
        "This is add to cart page",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
    Menus.favor: const Center(
      child: Text(
        "This is favorite page",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
    Menus.user: const profilePage(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex]!, // Display the correct page based on currentIndex
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value; // Update the current menu
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
        borderRadius: BorderRadius.all(Radius.circular(6)), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7), // Shadow color with transparency
            blurRadius: 8, // Blur radius for shadow
            offset: Offset(0, 4), // Position of the shadow
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
                color: currentIndex == Menus.cart ? Colors.amber[800] : Colors.grey,
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
