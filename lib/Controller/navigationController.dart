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
  bool hasUnreadNotifications = true;

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
          color: backgroundColorNavigationBar,
          backgroundColor: backgroundColorBehindNavigationBar,
          buttonBackgroundColor: buttonBackGroundColor,
          items: [
            const Icon(Icons.home, size: 30, color: iconColor),
            const Icon(Icons.bookmark, size: 30, color: iconColor),
            _buildNotificationIcon(),
            const Icon(Icons.person, size: 30, color: iconColor),
          ],
          onTap: (index) {
            setState(() {
              activePage = index;
              if (index == 2) {
                hasUnreadNotifications = false;
              }
            });
          },
          animationDuration: const Duration(milliseconds: 300),
        ),
      ),
    );
  }

  Widget _buildNotificationIcon() {
    return Stack(
      children: [
        const Icon(Icons.notifications, size: 30, color: iconColor),
        if (hasUnreadNotifications)
          Positioned(
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),
              constraints: const BoxConstraints(
                minWidth: 14,
                minHeight: 14,
              ),
              child: const Text(
                '', // You can also display the number of notifications here
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
