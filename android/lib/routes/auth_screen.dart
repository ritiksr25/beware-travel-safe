import 'package:beware_travel_safe/providers/auth_provider.dart';
import 'package:beware_travel_safe/routes/register_screen.dart';
import 'package:beware_travel_safe/routes/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  bool _isLoading = false;

  bool passwordVisible;

  final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();

  String authToken;
  @override
  void initState() {
    passwordVisible = true;
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
        title: Text(
          'Message!',
          style: TextStyle(
            fontSize: 32,
            fontFamily: 'Product Sans',
            color: const Color(0xFF7B65E4),
            fontWeight: FontWeight.w600,
          ),
        ),
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
    if (!_formKeyLogin.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKeyLogin.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      // Log user in
      await Provider.of<Auth>(context)
          .login(
            _authData['email'],
            _authData['password'],
          )
          .timeout(const Duration(seconds: 30), onTimeout: _onTimeout);
      final String msg = Provider.of<Auth>(context).loginMessage;
      if (msg == 'Login Successful') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchScreen()),
        );
      } else
        _showErrorDialog(Provider.of<Auth>(context).loginMessage);
    } catch (error) {
      if (error.toString().isNotEmpty)
        _showErrorDialog(Provider.of<Auth>(context).loginMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

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
                  Form(
                    key: _formKeyLogin,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              top: 20.0, left: 24.0, right: 24.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
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
                                  !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                      .hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                _authData['email'] = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 20.0, left: 24.0, right: 24.0),
                          child: TextFormField(
                            obscureText: passwordVisible,
                            style: TextStyle(color: Colors.black),
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
                            ),
                            validator: (String value) {
                              if (value.isEmpty || value.length < 6) {
                                return 'Please enter valid password';
                              }
                            },
                            onSaved: (value) {
                              setState(() {
                                _authData['password'] = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_isLoading)
                    Container(
                      margin: const EdgeInsets.only(left: 16.0, top: 10),
                      padding: EdgeInsets.all(10.0),
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFF7B65E4)),
                      ),
                    )
                  else
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
                          onPressed: _submit,
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
                              color: const Color(0xFF767676)),
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
