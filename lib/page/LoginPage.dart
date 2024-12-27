import 'package:flutter/material.dart';

import '../componants/AppTextField.dart';
import '../config/AppRoutes.dart';

class loginPage extends StatelessWidget {
  loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A2947),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Spacer(),
                const Text(
                  "Hello, welcome back!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20), // Space between texts
                const Text(
                  "Login to continue",
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                Spacer(),
                AppTextField(
                  hint: 'UserName',
                ),
                SizedBox(height: 8,),
                AppTextField(
                  hint: 'Password',
                ),
                Spacer(),
                SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.mainpage);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFBD512),
                      elevation: 5,
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      print("Forget password button pressed");
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white70,
                    ),
                    child: const Text("Forget Password ?"),
                  ),
                ),
                Spacer(),
                const Text(
                  "Or sign in with",
                  style: TextStyle(
                    color: Color(0xffD8D8D8),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(7),
                  child: ElevatedButton(
                    onPressed: () {
                      print("Login with Facebook button pressed");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      elevation: 5,
                    ),
                    child: const Text("Login with Facebook"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(7),
                  child: ElevatedButton(
                    onPressed: () {
                      print("Sign with Google button pressed");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      elevation: 5,
                    ),
                    child: const Text("Sign with Google"),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Color(0xffD8D8D8),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoutes.signup);
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white70,
                        ),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            color: Color(0xffFBD512),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
