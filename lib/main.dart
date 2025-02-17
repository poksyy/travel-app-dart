import 'package:flutter/material.dart';
import 'package:form_and_list/theme/theme.dart';

import 'config/route_config.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: '/splash',
      onGenerateRoute: RouteConfig.onGenerateRoute,
    );
  }
}
