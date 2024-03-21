import 'package:flutter/material.dart';
import 'package:bestest_calculator/home_page.dart';
import 'package:bestest_calculator/general/ui_constants.dart';
import 'package:flutter/services.dart';


/// The main function of the application.
/// It ensures that the widget binding is initialized before running the app.
/// It also sets the preferred orientation of the app to portrait mode.
/// In other words, the app will only be displayed in portrait mode.
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp,
       DeviceOrientation.portraitDown]
      ).then((_) {
        runApp(const MyApp());
      },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: MidnightGray,
          body: HomePage()
      ),
    );
  }
}


