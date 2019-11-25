import 'package:beware_travel_safe/models/view_profile_model.dart';
import 'package:beware_travel_safe/providers/auth_provider.dart';
import 'package:beware_travel_safe/routes/auth_screen.dart';
import 'package:beware_travel_safe/routes/home_screen.dart';
import 'package:beware_travel_safe/routes/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> scaffoldKeyProfileScreen =
      GlobalKey<ScaffoldState>();
  bool _isInit;
  bool _isLoading;
  ViewProfile _viewProfile;
  @override
  void initState() {
    _isInit = true;
    _isLoading = false;
    super.initState();
  }

  void didChangeDependencies() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Auth>(context).viewProfile().then(
        (_) {
          setState(() {
            _isLoading = false;
            _viewProfile = Provider.of<Auth>(context).viewProfileData;
          });
        },
      );
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Alert!'),
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
            child: Text('No'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
              Provider.of<Auth>(context).logout();
              Navigator.of(ctx).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AuthScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (_, profile, ch) => Scaffold(
        key: scaffoldKeyProfileScreen,
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.60,
          child: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: 100,
                  child: DrawerHeader(
                    child: Text(
                      'Dashboard',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.5,
                        fontFamily: "Montserrat",
                        fontSize: 20.0,
                        wordSpacing: 1,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF7B65E4),
                    ),
                  ),
                ),
                Consumer<Auth>(
                  builder: (_, customer, ch) => ListTile(
                    dense: true,
                    title: Text('Home Page'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchScreen()),
                      );
                    },
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF7B65E4)),
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => scaffoldKeyProfileScreen.currentState
                              .openDrawer(),
                          child: Icon(
                            Icons.menu,
                            color: Color(0xFF7B65E4),
                            size: 32.0,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.20,
                        ),
                        Text(
                          "Profile",
                          style: Theme.of(context).textTheme.title,
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 32.0),
                      child: CircleAvatar(
                        radius: 40.0,
                        child: Text(
                          '${_viewProfile.data.name[0].toUpperCase()}',
                          style: TextStyle(fontSize: 40.0),
                        ),
                      ),
                    ),
                    Text(
                      '${_viewProfile.data.name}',
                      style: TextStyle(
                          fontSize: 28.0,
                          fontFamily: 'Product Sans',
                          color: const Color(0xFF676767)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        '${_viewProfile.data.email}',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Product Sans',
                            color: const Color(0xFF676767)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 36.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 48),
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
                          onPressed: () => _showErrorDialog(
                            'Are you sure you want to logout?',
                          ),
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
