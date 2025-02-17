import 'package:flutter/material.dart';
import 'package:form_and_list/screens/splash_screen.dart';
import 'package:form_and_list/screens/login_screen.dart';
import 'package:form_and_list/screens/home_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    login: (context) => LoginScreen(),
    home: (context) {
      final String user = ModalRoute.of(context)!.settings.arguments as String;
      return HomeScreen(user: user);
    },
  };
}
