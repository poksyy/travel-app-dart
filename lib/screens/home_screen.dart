import 'package:flutter/material.dart';
import 'package:form_and_list/data/city_provider.dart';
import 'package:provider/provider.dart';
import 'package:form_and_list/l10n/app_localizations.dart';
import 'package:form_and_list/widget/city_item.dart';
import 'package:form_and_list/widget/language_selector.dart';
import 'package:form_and_list/screens/city_details_screen.dart';

class HomeScreen extends StatelessWidget {
  final String user;

  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return ChangeNotifierProvider(
      create: (_) => CityProvider(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(localizations.home),
          backgroundColor: Theme.of(context).primaryColor,
          actions: [LanguageSelector()],
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
                      border: Border.all(color: Theme.of(context).primaryColor, width: 4.0),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/images/profile-picture.jpg'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "${localizations.welcome}, ${user}!",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Consumer<CityProvider>(
                  builder: (context, cityProvider, child) {
                    return ListView.builder(
                      itemCount: cityProvider.cities.length,
                      itemBuilder: (context, index) {
                        final city = cityProvider.cities[index];

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
                              cityProvider.removeCity(deletedCity);
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
