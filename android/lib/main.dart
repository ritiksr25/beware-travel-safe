import 'package:beware_travel_safe/routes/home_screen.dart';
import 'package:beware_travel_safe/routes/intro_screen.dart';
import 'package:beware_travel_safe/routes/profile_screen.dart';
import 'package:beware_travel_safe/routes/register_screen.dart';
import 'package:beware_travel_safe/routes/search_screen.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Travel Safe",
      theme: ThemeData(
          textTheme: ThemeData.dark().textTheme.copyWith(
                headline: TextStyle(
                  fontSize: 36,
                  fontFamily: 'Product Sans',
                  color: const Color(0xFF676767),
                  fontWeight: FontWeight.w600,
                ),
                title: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Product Sans',
                  color: const Color(0xFF7B65E4),
                  fontWeight: FontWeight.w600,
                ),
                body1: TextStyle(),
              )),
      home: IntroScreen(),
    );
  }
}
