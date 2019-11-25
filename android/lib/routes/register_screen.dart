import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:beware_travel_safe/routes/auth_screen.dart';
import 'package:beware_travel_safe/providers/auth.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  static final GlobalKey<FormState> _formKeyRegisterUser =
      GlobalKey<FormState>();

  Map<String, String> _authData = {
    'name': '',
    'email': '',
    'password': '',
    'isAdmin': '',
  };
  bool _isLoading = false;

  @override
  void initState() {
    _authData['isAdmin'] = 'false';
    super.initState();
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Message'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  void _onTimeout() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Message!'),
        content: Text('Oopss...Request Time Out !!'),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKeyRegisterUser.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKeyRegisterUser.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Auth>(context, listen: false)
          .signup(
            _authData['name'],
            _authData['email'],
            _authData['password'],
            _authData['isAdmin'],
          )
          .timeout(const Duration(seconds: 20), onTimeout: _onTimeout);
      final String msg = Provider.of<Auth>(context).signUpMessage;
      Future.delayed(Duration.zero, () => _showErrorDialog(msg));
      if (msg == 'Successfully Registered') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AuthScreen()),
        );
      }
    } catch (error) {
      if (error.toString().isNotEmpty)
        _showErrorDialog(Provider.of<Auth>(context).signUpMessage);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Register",
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'Product Sans',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Image(
                width: 200.0,
                image: AssetImage('assets/images/registerimage.png'),
              ),
              Form(
                key: _formKeyRegisterUser,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
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
                        style: TextStyle(color: Colors.black),
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
                      padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
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
                        style: TextStyle(color: Colors.black),
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
                          hintText: "Re-Password",
                          prefixIcon: const Icon(
                            Icons.vpn_key,
                            color: const Color(0xFF7B65E4),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (_isLoading)
                Container(
                    padding: EdgeInsets.all(5),
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0XFFB4344D)),
                    ))
              else
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 48),
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
                      onPressed: _submit,
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

