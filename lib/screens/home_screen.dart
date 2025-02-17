import 'package:flutter/material.dart';
import 'package:form_and_list/models/city.dart';
import 'package:form_and_list/screens/city_details_screen.dart';

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

  List<City> cities = [
    City(
      name: 'Manila',
      country: 'Philippines',
      population: 1780148,
      imagePath: 'assets/images/manila.jpg',
      description: 'Manila, the capital of the Philippines, is a bustling metropolis known for its rich history and vibrant culture.',
    ),
    City(
      name: 'Quebec',
      country: 'Canada',
      population: 531000,
      imagePath: 'assets/images/quebec.png',
      description: 'Quebec is a French-speaking province in Canada, famous for its stunning architecture and winter festivals.',
    ),
    City(
      name: 'Mar del Plata',
      country: 'Argentina',
      population: 617000,
      imagePath: 'assets/images/mar-de-plata.jpg',
      description: 'Mar del Plata is a resort city in Argentina known for its beaches, fishing, and lively nightlife.',
    ),
    City(
      name: 'Barcelona',
      country: 'Spain',
      population: 1620343,
      imagePath: 'assets/images/barcelona.jpg',
      description: 'Barcelona, a city in Spain, is renowned for its art, architecture, and the iconic Sagrada Familia.',
    ),
  ];

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
                  return GestureDetector(
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
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x4D9E9E9E),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Hero(
                            tag: city.name,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                city.imagePath,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  city.name,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Country: ${city.country}',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Text(
                                  'Population: ${city.population}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
