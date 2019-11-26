import 'package:beware_travel_safe/routes/profile_screen.dart';
import 'package:beware_travel_safe/routes/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  GoogleMapController mapController;
  Position position;
  Widget _child;
  bool _isLoading;
  bool _isCrimeSelected = true;

  @override
  void initState() {
    _isLoading = true;
    getCurrentLocation();
    super.initState();
  }

  void getCurrentLocation() async {
    Position res = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      position = res;
      _child = mapWidget();
      _isLoading = false;
    });
  }

  final LatLng _center = const LatLng(28.644800, 77.216721);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 8.0,
            ),
          ),
          if (_isLoading)
            Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2.2,
                    left: MediaQuery.of(context).size.width / 2.2),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF7B65E4)),
                )),
          Container(
            padding: EdgeInsets.only(bottom: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                      bottomRight: Radius.circular(32.0)),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 40.0, left: 20.0, right: 20.0, bottom: 12.0),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileScreen()),
                            );
                          },
                          child: Icon(
                            Icons.menu,
                            color: Color(0xFF7B65E4),
                            size: 32.0,
                          ),
                        ),
                        Text(
                          'Home',
                          style: Theme.of(context).textTheme.title,
                        ),
                        InkWell(
                          child: Icon(
                            Icons.search,
                            color: Color(0xFF7B65E4),
                            size: 32.0,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 60.0),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          if (_isCrimeSelected)
                            Image(
                              height: 52.0,
                              image:
                                  AssetImage('assets/images/crimeselected.png'),
                            ),
                          if (_isCrimeSelected)
                            Image(
                              height: 52.0,
                              image: AssetImage(
                                  'assets/images/accidentunselected.png'),
                            ),
                          if (!_isCrimeSelected)
                            Image(
                              height: 52.0,
                              image: AssetImage(
                                  'assets/images/crimeunselcted.png'),
                            ),
                          if (!_isCrimeSelected)
                            Image(
                              height: 52.0,
                              image: AssetImage(
                                  'assets/images/accidentselected.png'),
                            ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget mapWidget() {
    return GoogleMap(
      mapType: MapType.normal,
      markers: _createMarker(),
      initialCameraPosition: CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 15,
      ),
      onMapCreated: (GoogleMapController controller) {
        mapController = controller;
      },
    );
  }

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId("current location"),
        position: LatLng(position.latitude, position.longitude),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: "current location"),
      ),
    ].toSet();
  }
}
