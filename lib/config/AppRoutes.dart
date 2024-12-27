import 'package:flutter/cupertino.dart';
import 'package:homemarket/page/AppSetting.dart';
import 'package:homemarket/page/Home.dart';
import 'package:homemarket/page/mainPage.dart';
import 'package:homemarket/page/profilePage.dart';

import '../page/AddressListBook.dart';
import '../page/LoginPage.dart';
import '../page/NewTrendPage.dart';
import '../page/homepage.dart';
import '../page/signUp.dart';

class AppRoutes{
  static final pages ={

    homepage: (context)=> homePage(),
    loginpage: (context)=> loginPage(),
    signup: (context) => signUp(),
    mainpage: (context) => mainPage(),
    profilepage: (context) => profilePage(),
    settings: (context) => AppSetting(),
    addressBook : (context) => AddressListBook(),
    NewTrend : (context) => NewTrendPage(),
    NavigatorHome : (context) => Home(),

  };

  static const homepage = '/home';
  static const loginpage ='/login';
  static const signup = '/sign';
  static const mainpage = '/mainPage';
  static const profilepage = '/profile';
  static const settings = '/setting';
  static const addressBook = '/location';
  static const NewTrend = '/NewTrend';
  static const NavigatorHome = '/Home';
}