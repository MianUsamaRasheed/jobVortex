import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:jobvortex/View/Worker_UI/worker_home_screen/worker_homepage.dart';
import 'package:jobvortex/View/Worker_UI/worker_notification_screen/worker_notification_page.dart';
import 'package:jobvortex/View/Worker_UI/worker_profile_screen/worker_profile_page.dart';
import 'package:jobvortex/Model/utils/colors.dart';
import 'package:jobvortex/View/Worker_UI/worker_transaction_screen/worker_transactions_screen.dart';

class WorkerNavigationController extends StatefulWidget {
  const WorkerNavigationController({super.key});

  @override
  State<WorkerNavigationController> createState() =>
      _WorkerNavigationControllerState();
}

class _WorkerNavigationControllerState
    extends State<WorkerNavigationController> {
  int activePage = 0;
  bool hasUnreadNotifications = true; // Example flag for unread notifications

  @override
  Widget build(BuildContext context) {
    final screens = [
      const WorkerHomePage(),
      const Transactions(),
      const WorkerNotificationScreen(),
      const WorkerProfilePage(),
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
            const Icon(Icons.book_outlined, size: 30, color: iconColor),
            _buildNotificationIcon(),
            const Icon(Icons.person, size: 30, color: iconColor),
          ],
          onTap: (index) {
            setState(() {
              activePage = index;
              if (index == 2) { // Assuming tapping notifications clears them
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
                '', // Optional: Number of notifications
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
