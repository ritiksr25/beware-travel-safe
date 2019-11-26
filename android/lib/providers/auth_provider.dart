import 'dart:convert';
import 'dart:async';

import 'package:beware_travel_safe/models/get_data.dart';
import 'package:beware_travel_safe/models/view_profile_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String _token;
  String _id;
  String _userRole;
  String _userEmail;
  String _userName;
  String _signUpMessage;
  String _loginMessage;
  String userToken;
  String _errorMsg;
  ViewProfile _viewProfileData;
  List<GetData> _getDataofLoc;

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

  ViewProfile get viewProfileData {
    return _viewProfileData;
  }

  List<GetData> get getData {
    return [..._getDataofLoc];
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

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> viewProfile() async {
    final url = 'https://bewaretravelsafe.herokuapp.com/api/v1/users/profile';

    final token = await SharedPreferences.getInstance();
    final userToken = token.getString('userToken');

    try {
      final response = await http.get(
        url,
        headers: {
          'x-auth-token': userToken,
        },
      );

      final extractedData = json.decode(response.body);

      _viewProfileData = ViewProfile.fromJson(extractedData);
      print(_viewProfileData.toString());
      notifyListeners();
    } on NoSuchMethodError {} catch (error) {
      //throw (error);
    }
  }

  Future<void> getDataOfLoc({Map queryParameters}) async {
    final url = Uri.https("bewaretravelsafe.herokuapp.com",
        "/api/v1/data", queryParameters);

    final token = await SharedPreferences.getInstance();
    final userToken = token.getString('userToken');

    try {
      final response = await http.get(
        url,
        headers: {
          'x-auth-token': userToken,
        },
      );

      final extractedData = json.decode(response.body);
      List<GetData> _loadedLoc = [];
      _loadedLoc = (extractedData['data'] as List)
          .map((i) => GetData.fromJson(i))
          .toList();
      _getDataofLoc = _loadedLoc;
      print(
          '**************************************************************************************************************************************************************************************************************');
      
      print(_getDataofLoc.toList());
      print(
          '**************************************************************************************************************************************************************************************************************');

      notifyListeners();
    } on NoSuchMethodError {} catch (error) {
      //throw (error);
    }
  }

  Future<void> logout() async {
    _token = null;
    _userRole = null;

    final userDataPrefs = await SharedPreferences.getInstance();
    userDataPrefs.remove('userData');
    final tokenPrefs = await SharedPreferences.getInstance();

    tokenPrefs.remove('userToken');
    notifyListeners();
  }
}
