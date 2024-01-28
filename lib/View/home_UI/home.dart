import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:jobvortex/View/home_UI/bookmarksPage.dart';
import 'package:jobvortex/View/home_UI/notificationsPage.dart';
import 'package:jobvortex/View/home_UI/profilePage.dart';
import 'package:jobvortex/View/home_UI/homePage.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activePage = 0;

  @override
  Widget build(BuildContext context) {

    final screens = [
      const HomePage(),
      const BookMarks(),
      const Notifications(),
      const Profile(),
    ];
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: screens[activePage],
        bottomNavigationBar: CurvedNavigationBar(

          index: activePage,
          color: Colors.blue.shade900, // Background color of the navigation bar
          backgroundColor: Colors.transparent, // Background color behind the navigation bar
          buttonBackgroundColor: Colors.blue.shade900, // Background color of the navigation bar buttons
          items: const [
            Icon(Icons.home, size: 30, color: Colors.white), // You can adjust the icon color here
            Icon(Icons.bookmark, size: 30, color: Colors.white),
            Icon(Icons.notifications, size: 30, color: Colors.white),
            Icon(Icons.person, size: 30, color: Colors.white),
          ],
          onTap: (index){
            setState(() {
              activePage = index;
            });
          },
          animationDuration: const Duration(milliseconds: 300),
        ),
      ),
    );
  }
}
