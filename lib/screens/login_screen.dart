import 'package:flutter/material.dart';
import 'package:form_and_list/routes/app_routes.dart';
import 'package:form_and_list/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
  if (_formKey.currentState!.validate()) {
    String user = userController.text;
    String password = passwordController.text;

    if (user == "user" && password == "pass12345" || user == "Pau" && password == "pass12345") {
      Navigator.pushReplacementNamed(
        context, 
        AppRoutes.home, 
        arguments: user,
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
        ),
      );
    }
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "LET'S TRAVEL THE WORLD",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 130),
                SizedBox(
                  width: 500,
                  child: Image.asset(
                    'assets/images/travel_logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 50),
                TextFormField(
                  controller: userController,
                  decoration: InputDecoration(
                    labelText: "User",
                    border: const OutlineInputBorder(),
                    labelStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your username";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: const OutlineInputBorder(),
                    labelStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    if (value.length < 7) {
                      return "Password must be at least 7 characters long";
                    }
                    if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
                      return "Password must contain at least one letter";
                    }
                    if (!RegExp(r'\d').hasMatch(value)) {
                      return "Password must contain at least one number";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: login,
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: const Text("Log in"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
