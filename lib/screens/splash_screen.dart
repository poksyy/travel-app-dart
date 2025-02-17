import 'package:flutter/material.dart';
import 'package:form_and_list/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.pushReplacementNamed(context, AppRoutes.login);
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/travel_logo.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 10),

            const Text(
              "Explore the world, one city at a time.",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 30),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Stack(
                children: [
                  Container(
                    height: 5,
                    color: Colors.grey[300],
                  ),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      double width = _animation.value * MediaQuery.of(context).size.width * 0.8;
                      return Container(
                        height: 5,
                        width: width,
                        color: const Color(0xFF009688),
                      );
                    },
                  ),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      double translation = _animation.value * MediaQuery.of(context).size.width * 0.7;
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: Transform.translate(
                          offset: Offset(translation, -30),
                          child: child!,
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/images/airplane_icon.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
