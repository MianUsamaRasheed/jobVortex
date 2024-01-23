import 'package:flutter/material.dart';
import 'package:jobvortex/View/Introductory_UI/splash.dart';
import 'Model/utils/dimension.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Splash(),
    );
  }
}

