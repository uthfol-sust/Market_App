import 'package:homemarket/page/mainPage.dart';
import 'package:homemarket/page/profilePage.dart';

import '../page/homepage.dart';
import '../page/signUp.dart';

class AppRoutes{
  static final pages ={

    homepage: (context)=> homePage(),
    signup: (context) => signUp(),
    mainpage: (context) => mainPage(),
    profilepage: (context) => profilePage(),
  };

  static const homepage = '/home';
  static const signup = '/sign';
  static const mainpage = '/mainPage';
  static const profilepage = '/profile';
}