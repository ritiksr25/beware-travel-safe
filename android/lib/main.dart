import 'package:beware_travel_safe/providers/auth_provider.dart';
import 'package:beware_travel_safe/routes/intro_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: "Travel Safe",
          theme: ThemeData(
              primaryColor: Color(0xFF7B65E4),
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
                    body1: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Product Sans',
                      color: const Color(0xFF7B65E4),
                      fontWeight: FontWeight.w600,
                    ),
                    body2: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Product Sans',
                      color: const Color(0xFF676767),
                      fontWeight: FontWeight.w400,
                    ),
                  )),
          home: IntroScreen(),
        ),
      ),
    );
  }
}
