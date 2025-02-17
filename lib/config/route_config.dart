import 'package:flutter/material.dart';
import 'package:form_and_list/screens/splash_screen.dart';
import 'package:form_and_list/screens/login_screen.dart';
import 'package:form_and_list/screens/home_screen.dart';

class RouteConfig {
  // class that defines routes navigation logic
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/home':
        final String user = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => HomeScreen(user: user));
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
