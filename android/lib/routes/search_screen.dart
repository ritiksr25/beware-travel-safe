import 'package:beware_travel_safe/providers/auth_provider.dart';
import 'package:beware_travel_safe/routes/profile_screen.dart';
import 'package:beware_travel_safe/routes/route_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final GlobalKey<ScaffoldState> scaffoldKeySearchScreen =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKeySearchScreen,
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
                  title: Text('View Profile'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      scaffoldKeySearchScreen.currentState.openDrawer();
                    },
                    child: Icon(
                      Icons.menu,
                      color: Color(0xFF7B65E4),
                      size: 32.0,
                    ),
                  ),
                  Image(
                    image: AssetImage("assets/images/searchimage.png"),
                  )
                ],
              ),
              Text(
                "Hello,\nWhere to go?",
                style: TextStyle(
                  fontSize: 42.0,
                  fontFamily: 'Product Sans',
                  color: Color(0xFF676767),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
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
                    hintText: "From?",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
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
                    hintText: "Where to ?",
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 20.0,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 48),
                    child: Text(
                      "Let's go",
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RouteScreen()),
                      );
                    },
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
