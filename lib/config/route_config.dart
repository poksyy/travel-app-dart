import 'package:flutter/material.dart';
import 'package:form_and_list/screens/splash_screen.dart';
import 'package:form_and_list/screens/login_screen.dart';
import 'package:form_and_list/screens/main_screen.dart';

class RouteConfig {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/main':
        return MaterialPageRoute(builder: (_) => const MainScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
