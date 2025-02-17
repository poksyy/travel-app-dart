import 'package:flutter/material.dart';
import 'package:form_and_list/screens/city_details_screen.dart';
import 'package:form_and_list/data/city_data.dart';
import 'package:form_and_list/widget/city_item.dart';

class HomeScreen extends StatefulWidget {
  final String user;

  const HomeScreen({super.key, required this.user});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  void logout() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final String user = widget.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 4.0,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/profile-picture.jpg'),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "Welcome, $user!",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: cities.length,
                itemBuilder: (context, index) {
                  final city = cities[index];
                  return CityItem(
                    city: city,
                    onTap: () async {
                      final deletedCity = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityDetailsScreen(city: city),
                        ),
                      );
                      if (deletedCity != null) {
                        setState(() {
                          cities.removeWhere((city) => city.name == deletedCity.name);
                        });
                      }
                    },
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: logout,
                style: Theme.of(context).elevatedButtonTheme.style,
                child: const Text(
                  "Log Out",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
