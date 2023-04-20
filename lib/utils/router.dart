import 'package:flutter/material.dart';
import 'package:todo_app/ui/home/tab_box.dart';
import 'package:todo_app/ui/onboarding_page/onboarding_page.dart';
import 'package:todo_app/ui/splash_page/splash_page.dart';
import 'package:todo_app/utils/constants/page_names.dart';

class AppRoute {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageName.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case PageName.tabBox:
        return MaterialPageRoute(builder: (_) => const TabBox());
      case PageName.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingPage());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
