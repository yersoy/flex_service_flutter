import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'pages/main.dart';
import 'pages/login.dart';
import 'pages/splash.dart';

import 'core/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ritma Service',
      theme: ThemeData(
        primaryColor: Colors.blueGrey[800],
        textTheme: GoogleFonts.poppinsTextTheme(TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(
            fontSize: 14.0,
          ),
        )),
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case Routes.LoginPage:
            return MaterialPageRoute(
                builder: (_) => LoginPage(), settings: settings);
            break;
          case Routes.HomePage:
            return MaterialPageRoute(
                builder: (_) => Main(), settings: settings);
            break;
          default:
            return MaterialPageRoute(
                builder: (_) => Splash(), settings: settings);
        }
      },
      home: Splash(),
    );
  }
}
