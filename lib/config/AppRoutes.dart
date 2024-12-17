import 'package:homemarket/page/AppSetting.dart';
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
    settings: (context) => AppSetting(),
  };

  static const homepage = '/home';
  static const signup = '/sign';
  static const mainpage = '/mainPage';
  static const profilepage = '/profile';
  static const settings = '/setting';
}