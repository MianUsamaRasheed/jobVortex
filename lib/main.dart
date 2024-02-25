import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jobvortex/Controller/client_data_controller.dart';
import 'package:jobvortex/View/Introductory_UI/splash.dart';
import 'package:provider/provider.dart';
import 'Model/utils/dimension.dart';
import 'firebase_options.dart';
import 'package:jobvortex/Controller/worker_data_controller.dart';
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserModel()),
        ChangeNotifierProvider(create: (context) => ClientModel()), // Add ClientModel provider
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initMediaQuerySize(context);
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Splash(),
    );
  }
}
