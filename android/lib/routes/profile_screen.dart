import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40.0,horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Profile",
              style: Theme.of(context).textTheme.title,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 32.0),
              child: CircleAvatar(
                radius: 40.0,
                child: Text(
                  "S",
                  style: TextStyle(
                    fontSize: 40.0
                  ),
                ),
              ),
            ),
            Text(
              "Shubham Singh",
              style: TextStyle(
                fontSize: 28.0,
                fontFamily: 'Product Sans',
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "shubham100ev@gmail.com",
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Product Sans',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 36.0),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 48),
                  child: Text(
                    "Log out",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Product Sans',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  color: const Color(0xFF7B65E4),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(8.0)),
                  onPressed: () {},
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
