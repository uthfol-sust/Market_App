import 'package:homemarket/page/mainPage.dart';

import '../page/homepage.dart';
import '../page/signUp.dart';

class AppRoutes{
  static final pages ={

    homepage: (context)=> homePage(),
    signup: (context) => signUp(),
    mainpage: (context) => mainPage(),

  };

  static const homepage = '/home';
  static const signup = '/sign';
  static const mainpage = '/mainPage';
}