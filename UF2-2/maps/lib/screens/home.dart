import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Map<String, String> place = {
    'name': 'Oeschinen Lake Campground',
    'address': 'Kandersteg, Switzerland',
    'rating': '41',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("⛺ Campground"),
        toolbarHeight: 100,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[100],
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/1');
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          place['name']!,
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          place['address']!,
                          style: const TextStyle(
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 119, 119, 119),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20.0),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20.0,
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          place['rating']!,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
