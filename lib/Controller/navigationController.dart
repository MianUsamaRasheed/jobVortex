import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:jobvortex/View/bookmarkPage_UI/bookmarksPage.dart';
import 'package:jobvortex/View/notificationPage_UI/notificationsPage.dart';
import 'package:jobvortex/View/profilePage_UI/profilePage.dart';
import 'package:jobvortex/View/home_UI/homePage.dart';
import 'package:jobvortex/Model/utils/colors.dart';

class NavigationController extends StatefulWidget {
  const NavigationController({super.key});

  @override
  State<NavigationController> createState() => _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {
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
          color: backgroundColorNavigationBar, // Background color of the navigation bar
          backgroundColor: backgroundColorBehindNavigationBar, // Background color behind the navigation bar
          buttonBackgroundColor: buttonBackGroundColor, // Background color of the navigation bar buttons
          items: const [
            Icon(Icons.home, size: 30, color: iconColor), // You can adjust the icon color here
            Icon(Icons.bookmark, size: 30, color: iconColor),
            Icon(Icons.notifications, size: 30, color: iconColor),
            Icon(Icons.person, size: 30, color: iconColor),
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
