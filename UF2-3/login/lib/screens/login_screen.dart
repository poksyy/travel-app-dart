import 'package:flutter/material.dart';
import 'package:login/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

void login() {
  String user = userController.text;
  String password = passwordController.text;

  if (user == "Usuario" && password == "12345" || user == "Pau" && password == "12345") {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(user),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Successfully logged in!"),
        backgroundColor: Colors.green,
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Invalid credentials"),
        backgroundColor: Colors.red,
      )
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SizedBox(
                width: 400,
                child: Image.asset(
                  'assets/images/flutter_icon.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            TextField(
              controller: userController,
              decoration: const InputDecoration(
                labelText: "User",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25.0),
            ElevatedButton(
              onPressed: login,
              style: Theme.of(context).elevatedButtonTheme.style,
              child: const Text("Log in"),
            ),
          ],
        ),
      ),
    );
  }
}
