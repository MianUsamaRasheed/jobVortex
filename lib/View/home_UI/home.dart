import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.blue.shade900, // Background color of the navigation bar
          backgroundColor: Colors.white, // Background color behind the navigation bar
          buttonBackgroundColor: Colors.blue.shade900, // Background color of the navigation bar buttons
          items: const [
            Icon(Icons.home, size: 30, color: Colors.white), // You can adjust the icon color here
            Icon(Icons.bookmark, size: 30, color: Colors.white),
            Icon(Icons.notifications, size: 30, color: Colors.white),
            Icon(Icons.person, size: 30, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
