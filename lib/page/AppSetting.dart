import 'package:flutter/material.dart';
import 'package:homemarket/componants/AppCardItem.dart';
import 'package:homemarket/componants/appBar.dart';

class AppSetting extends StatelessWidget {
  const AppSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Settings"),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 2,
            child: Column(
              children: [
                AppCardItem(
                  icon:  Icons.public,
                  title: "Shop in",
                  onTap: (){

                  },
                  subtitle: "United States",
                ),
                Divider(),
                AppCardItem(
                  icon:  Icons.attach_money,
                  title: "Currency",
                  onTap: (){

                  },
                  subtitle: "USD",
                ),
                Divider(),
                AppCardItem(
                    icon: Icons.straighten,
                    title: "Sizes",
                    onTap: (){

                    },
                    subtitle: "US",
                ),
                Divider(),
                AppCardItem(
                    icon: Icons.notifications_none,
                    title: "Notifications",
                    onTap: (){

                },),
                Divider(),
                AppCardItem(icon: Icons.face, title: "Face ID", onTap: (){ },),
                Divider(),
                AppCardItem(
                    icon:  Icons.shopping_bag,
                    title: "Shop",
                    onTap: (){

                    },
                    subtitle: "Men",
                ),
                Divider(),
                AppCardItem(icon: Icons.screenshot, title: "Screenshots", onTap: (){ },),
                Divider(),
                AppCardItem(icon: Icons.lock_outline, title: "Terms & Conditions", onTap: (){ }),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
