import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  DateTime _expiryDate;
  String _token;
  String _id;
  String _userRole;
  String _userEmail;
  String _userName;
  String _signUpMessage;
  String _loginMessage;
  String userToken;
  String _errorMsg;

  bool get isAuth {
    print('in isAuth');

    return _token != null;
  }

  String get token {
    return _token;
  }

  String get errorMsg {
    return _errorMsg;
  }

  String get userId {
    return _id;
  }

  String get userRole {
    return _userRole;
  }

  String get userEmail {
    return _userEmail;
  }

  String get userName {
    return _userName;
  }

  String get signUpMessage {
    return _signUpMessage;
  }

  String get loginMessage {
    return _loginMessage;
  }

  Future<void> signup(
      String name, String email, String password, String isAdmin) async {
    final url = 'https://bewaretravelsafe.herokuapp.com/api/v1/users/register';
    try {
      Map<String, String> body = {
        'name': name,
        'email': email,
        'password': password,
        'isAdmin': isAdmin,
      };
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );
      final responseData = json.decode(response.body);
      print(json.decode(response.body));

      _signUpMessage = responseData['message'];
    } catch (error) {
      throw error;
    }
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    final url = 'https://bewaretravelsafe.herokuapp.com/api/v1/users/login';
    try {
      Map<String, dynamic> body = {
        'email': email,
        'password': password,
      };

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );
      final responseData = json.decode(response.body);
      final responseHeaders = response.headers;
      _loginMessage = responseData['message'];

      print(json.decode(response.body));

      _token = responseHeaders['x-auth-token'];

      final token = await SharedPreferences.getInstance();
      token.setString('userToken', _token);

      _expiryDate = DateTime.now().add(
        Duration(
          seconds: 300,
        ),
      );

      // _autoLogout();
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
