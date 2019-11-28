import 'package:beware_travel_safe/providers/google_maps_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class RouteSetting extends StatefulWidget {
  @override
  _RouteSettingState createState() => _RouteSettingState();
}

class _RouteSettingState extends State<RouteSetting> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Consumer<AppState>(
      builder: (_, customer, ch) => Scaffold(
        body: SafeArea(
          child: appState.initialPosition == null
              ? Container(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SpinKitRotatingCircle(
                          color: Colors.black,
                          size: 50.0,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: appState.locationServiceActive == false,
                      child: Text(
                        "Please enable location services!",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    )
                  ],
                ))
              : Consumer<AppState>(
                  builder: (_, customer, ch) => Stack(
                    children: <Widget>[
                      GoogleMap(
                        initialCameraPosition: CameraPosition(
                            target: appState.initialPosition, zoom: 10.0),
                        onMapCreated: appState.onCreated,
                        myLocationEnabled: true,
                        mapType: MapType.normal,
                        compassEnabled: true,
                        markers: appState.markers,
                        onCameraMove: appState.onCameraMove,
                        polylines: appState.polyLines,
                      ),
                      Positioned(
                        top: 50.0,
                        right: 15.0,
                        left: 15.0,
                        child: Container(
                          height: 50.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1.0, 5.0),
                                  blurRadius: 10,
                                  spreadRadius: 3)
                            ],
                          ),
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            cursorColor: Colors.black,
                            controller: appState.locationController,
                            decoration: InputDecoration(
                              icon: Container(
                                margin: EdgeInsets.only(left: 20, top: 5),
                                width: 10,
                                height: 10,
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                ),
                              ),
                              hintText: "pick up",
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.only(left: 15.0, top: 16.0),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 105.0,
                        right: 15.0,
                        left: 15.0,
                        child: Container(
                          height: 50.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1.0, 5.0),
                                  blurRadius: 10,
                                  spreadRadius: 3)
                            ],
                          ),
                          child: TextField(
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            controller: appState.destinationController,
                            textInputAction: TextInputAction.go,
                            onSubmitted: (value) {
                              appState.sendRequest(value);
                            },
                            decoration: InputDecoration(
                              icon: Container(
                                margin: EdgeInsets.only(left: 20, top: 5),
                                width: 10,
                                height: 10,
                                child: Icon(
                                  Icons.local_taxi,
                                  color: Colors.black,
                                ),
                              ),
                              hintText: "destination?",
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.only(left: 15.0, top: 16.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
