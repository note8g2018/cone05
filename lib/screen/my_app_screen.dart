import 'package:flutter/material.dart';
import 'package:cone05/screen/log_in_screen.dart';
import 'package:cone05/screen/reg_screen.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      theme: ThemeData.dark(),
      initialRoute: LogIn.route,
      routes: {
        LogIn.route: (context) => LogIn(),
        Reg.route: (context) => Reg(),
      },
    );
  }
}
