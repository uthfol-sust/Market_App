import 'package:flutter/material.dart';
import 'package:homemarket/config/AppRoutes.dart';
import 'dart:ui';

import '../componants/AppCardItem.dart'; // For BackdropFilter

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  // Background Image with Blur Effect
                  Positioned.fill(
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/png/Theme.png', // Background image
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0), // Apply blur effect
                          child: Container(
                            color: Colors.black.withOpacity(0), // Optional: add opacity if needed
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      right: 0,
                      child: ElevatedButton(onPressed: (){
                        Navigator.of(context).pushNamed(AppRoutes.settings);
                      },
                        child: Icon(Icons.settings_sharp),)
                  ),
                  // Profile Image with Edit Icon
                  Center(
                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Profile Image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              'assets/png/img.jpg', // Profile Image
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Edit Icon at the top-right corner
                          Positioned(
                            top: -10,
                            right: -10,
                            child: IconButton(
                              color: Colors.white,
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.white70,
                                size: 25,
                              ),
                              onPressed: () {
                                // Define your edit action here
                                print('Edit icon tapped!');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Name and Additional Widgets
                  Positioned(
                    bottom: 60,
                    left: MediaQuery.of(context).size.width / 2 - 60,
                    child: Column(
                      children: [
                        const Text(
                          'Jessi Pham',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Add more widgets like buttons below
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.white, // Box color
                    borderRadius: BorderRadius.all(Radius.circular(6)), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3), // Shadow color with transparency
                        blurRadius: 8, // Blur radius for shadow
                        offset: Offset(0, 4), // Position of the shadow
                      ),
                    ],
                  ),
                  child:Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 2,
                    child: SizedBox(
                      height: 150, // Provide a fixed height
                      child: ListView(
                        children: [
                          AppCardItem(
                            icon: Icons.shopping_bag,
                            title: 'My order',
                            onTap: () {
                              print("click on my order");
                            },
                          ),
                          const Divider(),
                          AppCardItem(
                            icon: Icons.local_shipping,
                            title: 'Premier Delivery',
                            onTap: () {
                              print("click on Premier Delivery");
                            },
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                  )
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.white, // Box color
                    borderRadius: BorderRadius.all(Radius.circular(6)), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3), // Shadow color with transparency
                        blurRadius: 8, // Blur radius for shadow
                        offset: Offset(0, 4), // Position of the shadow
                      ),
                    ],
                  ),
                  child:Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 2,
                    child: Column(
                      children: [
                        AppCardItem(
                            icon:  Icons.account_box,
                            title: 'My details',
                            onTap: (){
                              print("click on my details");
                            },
                        ),
                        const Divider(),
                        AppCardItem(
                            icon: Icons.location_on,
                            title:  'Address book',
                            onTap:(){
                            Navigator.of(context).pushNamed(AppRoutes.addressBook);
                            } ,
                        ),
                        const Divider(),
                        AppCardItem(
                            icon: Icons.payment,
                            title: 'Payment methods',
                            onTap: (){
                              print("click on Payment methods");
                            },
                        ),
                        const Divider(),
                        AppCardItem(
                            icon: Icons.contact_mail,
                            title: 'Contact preferences',
                            onTap: (){
                              print("click on Contact preferences");
                            },
                        ),
                        const Divider(),
                        AppCardItem(
                            icon: Icons.person,
                            title: 'Social accounts',
                            onTap: (){
                              print("click on Social accounts ");
                            },
                        ),
                        const Divider(),
                        AppCardItem(
                          icon: Icons.logout,
                          title: 'Log out',
                          onTap: () {
                            // Show a confirmation dialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Text('Are you sure you want to log out?'),
                                  actions: [
                                    TextButton(
                                      child: Text('Cancel',style: TextStyle(color: Colors.blueGrey),),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text('OK',style: TextStyle(color: Colors.blueGrey)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pushReplacementNamed(AppRoutes.homepage);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        const Divider(),
                        SizedBox(height: 15,),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
