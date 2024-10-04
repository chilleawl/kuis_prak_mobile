import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlueDoorz',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> hotelList = [
    {
      "name": "Hotel A",
      "price": 500000,
      "imageUrl":
          "https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/hotel.jpg/150",
    },
    {
      "name": "Hotel B",
      "price": 600000,
      "imageUrl":
          "https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/hotel.jpg/150",
    },
    {
      "name": "Hotel C",
      "price": 550000,
      "imageUrl":
          "https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/hotel.jpg/150",
    },
    {
      "name": "Hotel D",
      "price": 700000,
      "imageUrl":
          "https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/hotel.jpg/150",
    },
    {
      "name": "Hotel E",
      "price": 800000,
      "imageUrl":
          "https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/hotel.jpg/150",
    },
    {
      "name": "Hotel F",
      "price": 750000,
      "imageUrl":
          "https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/hotel.jpg/150",
    },
    {
      "name": "Hotel G",
      "price": 650000,
      "imageUrl":
          "https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/hotel.jpg/150",
    },
    {
      "name": "Hotel H",
      "price": 900000,
      "imageUrl":
          "https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/hotel.jpg/150",
    },
    {
      "name": "Hotel I",
      "price": 1000000,
      "imageUrl":
          "https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/hotel.jpg/150",
    },
    {
      "name": "Hotel J",
      "price": 950000,
      "imageUrl":
          "https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/hotel.jpg/150",
    },
  ];

  void _launchURL() async {
    const url = 'https://traveloka.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Traveloka Hotel'),
      ),
      body: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https://raw.githubusercontent.com/asfararikza/assets_bluedoorz/refs/heads/main/BLUE%20DOORZ.png/50', //
                  width: 50,
                ),
                //
                Text(
                  'Selamat Datang di Traveloka!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                // Button ke Traveloka
                ElevatedButton(
                  onPressed: _launchURL,
                  child: Text('Kunjungi Website'),
                ),
              ],
            ),
          ),
          // GridView untuk hotel
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: hotelList.length,
              itemBuilder: (context, index) {
                final hotel = hotelList[index];
                return Card(
                  child: Column(
                    children: [
                      // Gambar Hotel
                      Image.network(
                        hotel['imageUrl'],
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hotel['name'],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Rp ${hotel['price']}/malam',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[700]),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('Pesan Sekarang'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
