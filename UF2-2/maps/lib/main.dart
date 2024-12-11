import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/oeschinen_lake.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/1': (context) =>OeschinenLakeScreen(),
        //'/2': (context) =>X(), 
        //'/3': (context) =>X(), 
      },
    );
  }
}
