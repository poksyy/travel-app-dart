import 'package:flutter/material.dart';
import 'package:login/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  final String user;

  const HomeScreen(this.user, {Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  void logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 4.0,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Welcome, ${widget.user}!",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      counter--;
                    });
                  },
                ),
                Text(
                  '$counter',
                  style: const TextStyle(fontSize: 32),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: logout,
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                backgroundColor: WidgetStateProperty .all(Colors.red),
                padding: WidgetStateProperty .all(const EdgeInsets.symmetric(vertical: 14, horizontal: 90)),
              ),
              child: const Text(
                "Log Out",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
