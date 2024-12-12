import 'package:flutter/material.dart';
import 'package:homemarket/componants/AppCheckBoxForSignUp.dart';
import 'package:homemarket/componants/Textbox.dart';
import 'package:homemarket/componants/appBar.dart';
import 'package:homemarket/componants/passwordText.dart';
import 'package:homemarket/config/AppRoutes.dart';
import 'package:homemarket/styles/AppColors.dart';
import 'package:homemarket/styles/AppTexts.dart';
import '../componants/AppTextField.dart';

enum Gender {
  none,
  male,
  female,
  others,
}

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  var gender = Gender.none;

  String? selectedDay;

  String? selectedMonth;

  String? selectedYear;

  bool? isChecked = false;

  // Lists for days, months, and years
  final List<String> days = List.generate(31, (index) => (index + 1).toString().padLeft(2, '0'));

  final List<String> months = List.generate(12, (index) => (index + 1).toString().padLeft(2, '0'));

  final List<String> years = List.generate(100, (index) => (DateTime.now().year - index).toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: "Sign Up"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30),

              //Email box....
              Text(
                "Email address",
                style: AppTexts.subText,
              ),
              const SizedBox(height: 7),
              const AppTextField(
                hint: 'Enter Email address',
              ),
              const SizedBox(height: 7),
              Textbox(text: "We'll send your order confirmation here", ),
              const SizedBox(height: 20),

              //Name TextField........
              Text(
                "First name",
                style: AppTexts.subText,
              ),
              SizedBox(height: 7),
              AppTextField(
                hint: 'Enter first name',
              ),
              SizedBox(height: 20),
              Text(
                "Last name",
                style: AppTexts.subText,
              ),
              SizedBox(height: 7),
              AppTextField(
                hint: 'Enter last name',
              ),

              //password TextField
              SizedBox(height: 20),
              Text(
                "Password",
                style: AppTexts.subText,
              ),
              SizedBox(height: 7),
              passwordText(hint: "Enter password"),
              Textbox(text: "Must be 10 or more characters",),

              //birthday
              SizedBox(height: 20),
              Text(
                "Date of Birth",
                style: AppTexts.subText,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Day Dropdown
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedDay,
                      hint: Text("Day"),
                      onChanged: (value) {
                        setState(() {
                          selectedDay = value;
                        });
                      },
                      items: days.map((day) {
                        return DropdownMenuItem(
                          value: day,
                          child: Text(day),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  // Month Dropdown
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedMonth,
                      hint: Text("Month"),
                      onChanged: (value) {
                        setState(() {
                          selectedMonth = value;
                        });
                      },
                      items: months.map((month) {
                        return DropdownMenuItem(
                          value: month,
                          child: Text(month),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  // Year Dropdown
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedYear,
                      hint: Text("Year"),
                      onChanged: (value) {
                        setState(() {
                          selectedYear = value;
                        });
                      },
                      items: years.map((year) {
                        return DropdownMenuItem(
                          value: year,
                          child: Text(year),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 7),
              Textbox(text:"you need to be 16 or over to use Ebuy" ),

              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Mostly interested in",
                    style: AppTexts.subText,
                  ),
                  SizedBox(width: 6,),
                  Text(
                    "(optional) :",
                    style: AppTexts.passage,
                  ),
                ],
              ),
              SizedBox(height: 7,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height:60,
                decoration: BoxDecoration(
                  color: Colors.white, // Box color
                  borderRadius: BorderRadius.all(Radius.circular(6)), // Rounded corners
                  boxShadow:[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // Shadow color with transparency
                      blurRadius: 8, // Blur radius for shadow
                      offset: Offset(0, 4), // Position of the shadow
                    ),

                  ],
                ),
                child: Row(
                  children: [
                    Radio<Gender>(
                      value: Gender.male,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                    ),
                    Text("Menswear"),
                    Spacer(),
                    Radio<Gender>(
                      value: Gender.female,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                    ),
                    Text("Womenwear"),
                  ],
                ),
              ),

              SizedBox(height: 20,),

              Container(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10), // Added horizontal padding
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                  children: [
                    Row(
                      children: [
                        Text(
                          "Contact preferred in",
                          style: AppTexts.subHeading2, // Custom text style
                        ),
                        Spacer(),
                        Icon(
                          Icons.close_rounded,
                          color: Colors.red,
                          size: 20,
                        ),
                      ],
                    ),
                    SizedBox(height: 5), // Add spacing between the two texts
                    Textbox(text: "Tell us which email you'd like"),
                    SizedBox(height: 20,),
                    AppCheckBoxForSignUp(text: "Discounts and Sales",),
                    AppCheckBoxForSignUp(text: "New stuff",),
                    AppCheckBoxForSignUp(text: "Your Exclusives",),
                    AppCheckBoxForSignUp(text: "App partner",),
                    SizedBox(height:30,),
                    Textbox(text: "Tell me more about these"),
                    SizedBox(height: 10,),
                    Textbox(text: "By creating your account, you agree to our"),
                    SizedBox(height: 10,),
                    Text(
                      "Term and conditions & Privacy policy",
                      style: TextStyle(
                        color: AppColors.buttonBackground,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 150,),

              Center(
                child: ElevatedButton(onPressed: (){
                  Navigator.of(context).pushReplacementNamed(AppRoutes.mainpage);
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonBackground,
                    minimumSize: Size(300, 50),
                  ),
                  child: const Text(
                    "Sign Up",
                    style:  AppTexts.subText,
                    ),
                  ),
              ),
              SizedBox(height: 70,)
            ],
          )

        ),
      ),
    );
  }
}
