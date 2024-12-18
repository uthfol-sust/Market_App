import 'package:flutter/material.dart';
import 'package:homemarket/componants/appBar.dart';
import 'package:homemarket/styles/AppTexts.dart';

import '../styles/AppColors.dart';

class AddressListBook extends StatelessWidget {
  const AddressListBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "My Address"),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Add your address list or other content here
                  Text(
                    "Your Addresses will appear here",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20), // Space between button and bottom
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add address button action
                },
                child: Text(
                  "Add New Address",
                  style: AppTexts.subText,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonBackground,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
