import 'package:flutter/material.dart';

class OeschinenLakeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String imageUrl =
        'https://www.homeschwiizhome.com/wp-content/uploads/2017/08/DSC04350-1030x685.jpg';

    return Scaffold(
      appBar: AppBar(title: const Text("Oeschinen Lake")),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Oeschinen Lake Campground",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Kandersteg, Switzerland",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 30.0, // Increased size
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      '41',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.call),
                    onPressed: () {},
                    iconSize: 50.0,
                  ),
                  const Text('Call', style: TextStyle(fontSize: 14.0)),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.directions),
                    onPressed: () {},
                    iconSize: 50.0,
                  ),
                  const Text('Route', style: TextStyle(fontSize: 14.0)),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {},
                    iconSize: 50.0,
                  ),
                  const Text('Share', style: TextStyle(fontSize: 14.0)),
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
                style: TextStyle(fontSize: 14.0),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
