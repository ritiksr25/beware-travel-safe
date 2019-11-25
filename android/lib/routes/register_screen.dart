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
  final _newPass = TextEditingController();
  final _newCnfPass = TextEditingController();

  bool passwordVisible;
  bool passwordVisible1;

  @override
  void initState() {
    _authData['isAdmin'] = 'false';
    passwordVisible = true;
    passwordVisible1 = true;
    super.initState();
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'Message',
          style: TextStyle(
            fontSize: 32,
            fontFamily: 'Product Sans',
            color: const Color(0xFF7B65E4),
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          message,
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Product Sans',
            color: const Color(0xFF676767),
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Okay',
              style: TextStyle(
                  color: const Color(0xFF7B65E4),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
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
        title: Text('Message!', style: Theme.of(context).textTheme.title),
        content: Text('Oopss...Request Time Out !!',
            style: Theme.of(context).textTheme.body2),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Okay',
              style: TextStyle(
                  color: const Color(0xFF7B65E4),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
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
              Text("Register", style: Theme.of(context).textTheme.title),
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
                        validator: (String value) {
                          if (value.trim().isEmpty) {
                            return 'Name is required';
                          }
                        },
                        onSaved: (value) {
                          _authData['name'] = value;
                        },
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
                        validator: (String value) {
                          if (value.isEmpty ||
                              !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                        },
                        onSaved: (value) {
                          _authData['email'] = value;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        controller: _newPass,
                        obscureText: passwordVisible,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color(0xFF7B65E4),
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
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
                        validator: (String value) {
                          if (value.isEmpty || value.length < 8) {
                            return 'must contain atleast 8 characters';
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        controller: _newCnfPass,
                        obscureText: passwordVisible,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color(0xFF7B65E4),
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
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
                        validator: (String value) {
                          if (value.length < 8) {
                            return 'must contain atleast 8 characters';
                          }
                          if (value != _newPass.text) {
                            return 'Password is not matching';
                          }
                        },
                        onSaved: (value) {
                          _authData['password'] = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              if (_isLoading)
                Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFF7B65E4)),
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
