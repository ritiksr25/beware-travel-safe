import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Register",
                style: Theme.of(context).textTheme.title,
              ),
              Image(
                width: 200.0,
                image: AssetImage('assets/images/registerimage.png'),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  style: TextStyle(
                      color: Colors.black
                  ),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: const Color(0xFF7B65E4), width: 1),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: const Color(0xFF707070), width: 0.2),
                    ),
                    hintText: "Name",
                    prefixIcon: const Icon(
                      Icons.account_circle,
                      color: const Color(0xFF7B65E4),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  style: TextStyle(
                      color: Colors.black
                  ),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: const Color(0xFF7B65E4), width: 1),
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
                padding: EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  style: TextStyle(
                      color: Colors.black
                  ),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: const Color(0xFF7B65E4), width: 1),
                    ),
                    filled: true,
                    fillColor: Colors.white,
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
                padding: EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  style: TextStyle(
                      color: Colors.black
                  ),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: const Color(0xFF7B65E4), width: 1),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: const Color(0xFF707070), width: 0.2),
                    ),
                    hintText: "Re-Password",
                    prefixIcon: const Icon(
                      Icons.vpn_key,
                      color: const Color(0xFF7B65E4),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 48),
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Product Sans',
                        fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
