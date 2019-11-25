import 'package:beware_travel_safe/routes/register_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Image(
              image: AssetImage("assets/images/introbg.png"),
            ),
            Container(
              padding: EdgeInsets.only(top: 68.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Image(
                      image: AssetImage("assets/images/authimage.png"),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 20.0, left: 24.0, right: 24.0),
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.black
                      ),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0xFF7B65E4), width: 1),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: const Color(0xFF707070), width: 0.2),
                        ),
                        hintText: "Email",
                        prefixIcon: const Icon(
                          Icons.email,
                          color: const Color(0xFF7B65E4),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 20.0, left: 24.0, right: 24.0),
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0xFF7B65E4), width: 1),
                        ),
                        border: const OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: const Color(0xFF707070), width: 0.2),
                        ),
                        hintText: "Password",
                        prefixIcon: const Icon(
                          Icons.vpn_key,
                          color: const Color(0xFF7B65E4),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 36.0, left: 24.0, right: 24.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 48),
                        child: Text(
                          "Log in",
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
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 40.0, left: 24.0, right: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Don't have an account ? ",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Product Sans',
                            color: const Color(0xFF767676)
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Product Sans',
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF7B65E4),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
