import 'package:beware_travel_safe/routes/auth_screen.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Image(
              image: AssetImage("assets/images/introbg.png"),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Image(
                    image: AssetImage("assets/images/introimage.png"),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Text(
                  "Travel Safe",
                  style: Theme.of(context).textTheme.headline,
                ),
                Container(
                  padding: EdgeInsets.only(top: 36.0, left: 24.0, right: 24.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 48),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'Product Sans',
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      color: const Color(0xFF7B65E4),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8.0)),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuthScreen()));
                      },
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
