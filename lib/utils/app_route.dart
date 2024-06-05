import 'package:contact_list/view/screens/HomeScreen/home_screen.dart';
import 'package:contact_list/view/screens/SplashScreen/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const String splashScreen = "/splash_screen";
  static const String homeScreen = "/home_screen";

  static MaterialPageRoute? generateRoute(RouteSettings settings) {
    Widget? widget;

    switch (settings.name) {
      case splashScreen:
        widget = const SplashScreen();
        break;

      case homeScreen:
        widget = const HomeScreen();
        break;
    }

    if (widget != null) {
      return MaterialPageRoute(builder: (context) => widget!);
    }

    return null;
  }
}
