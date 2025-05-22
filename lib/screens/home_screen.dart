import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:autoaid/screens/book_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> stations = const [
    {
      'name': 'FixIt Fast Garage',
      'type': 'Repair Shop',
      'distance': '2.0 km',
      'rating': '4.5',
      'image': 'images/car2.jpg',
    },
    {
      'name': 'AutoMate Service',
      'type': 'Mechanic',
      'distance': '0.8 km',
      'rating': '4.7',
      'image': 'images/car3.jpg',
    },
    {
      'name': 'Pit Stop Hub',
      'type': 'Fuel Station',
      'distance': '3.1 km',
      'rating': '4.3',
      'image': 'images/car4.jpg',
    },
    {
      'name': 'GearUp Garage',
      'type': 'Mechanic',
      'distance': '4.4 km',
      'rating': '4.2',
      'image': 'images/car5.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Stations',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children:
                stations
                    .map((station) => _buildStationCard(context, station))
                    .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildStationCard(BuildContext context, Map<String, dynamic> station) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                station['image'],
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    station['name'],
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    station['type'],
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 18,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        station['distance'],
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.star, size: 18, color: Colors.orange),
                      const SizedBox(width: 4),
                      Text(
                        station['rating'],
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookScreen(stationName: ''),
                        ),
                      );
                    },
                    child: Text(
                      'View Station',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
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
