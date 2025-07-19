import 'package:flutter/material.dart';
import 'package:projects/Routes/routes.dart';
import 'package:projects/View/BottomNavBar.dart';
import 'package:projects/View/Category.dart';
import 'package:projects/View/Profile.dart';
import 'package:projects/View/Register.dart';
import 'package:projects/View/SplachPage.dart';

import '../View/HomePage.dart';
import '../View/Login.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {

    case Routes.loginPage:
      return MaterialPageRoute(builder: (_) => Login(), settings: settings);
    case Routes.registerPage:
      return MaterialPageRoute(builder: (_) => Register(), settings: settings);
    case Routes.navbar:
      return MaterialPageRoute(builder: (_) => NavBar(), settings: settings);
    case Routes.homePage:
      return MaterialPageRoute(builder: (_) => HomePage(), settings: settings);
    case Routes.profilePage:
      return MaterialPageRoute(builder: (_) => ProfilePage(), settings: settings);
    case Routes.categoryPage:
      return MaterialPageRoute(builder: (_) => CategoryPage(), settings: settings);
    case Routes.splashPage:
      return MaterialPageRoute(builder: (_) => SplashScreen(), settings: settings);
    default:
      return MaterialPageRoute(
        builder: (_) => SplashScreen(),
        settings: settings,
      );
  }
}
