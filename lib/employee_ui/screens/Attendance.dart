import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:odoo_api/odoo_api.dart';
import 'package:odoo_client/app/data/services/odoo_api.dart';
import 'package:odoo_client/utilis/colors.dart';
import 'package:odoo_client/widget/button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GeolocatorWidget extends StatefulWidget {
  // static  createPage() {
  //   return(Icons.location_on, (context) => GeolocatorWidget());
  // }

  @override
  _GeolocatorWidgetState createState() => _GeolocatorWidgetState();
}

class _GeolocatorWidgetState extends State<GeolocatorWidget> {
  DateTime checkIn;
  DateTime checkOut;
  bool _employeeIn = false;
  var _client;
  // Director director = new Director();
  double dist;
  bool isCheckIn = false;
  bool isDisplayCard = false;
  bool isEnable = true;
  bool isPressed = true;
  Geolocator locator;
  GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  bool slidepress = false;
  String odooURL;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.502019, 74.353282),
    zoom: 20.4746,
  );

  Completer<GoogleMapController> _controller = Completer();
  String _currentAddress;
  Position _currentPosition;

  getdistance() {
    dist = Geolocator.distanceBetween(
      31.502019,
      74.353282,
      _currentPosition.latitude,
      _currentPosition.longitude,
    );
    dist > 100.0
        ? setState(() {
            isEnable = false;
          })
        : setState(() {
            isEnable = true;
          });
    print("your distance is $dist");
  }

  // DateTime selectedDate = DateTime.now();
  // DateTime _date = DateTime.now();
  // final TimeOfDay selectedTime = TimeOfDay.now();
  // final DateFormat formatter = DateFormat('dd-MM-yyyy');
  // final DateFormat timeformat = DateFormat('hh:mm');
  // DateTime _selectedDate;
  // DateTime time;
  @override
  void initState() {
    super.initState();
    _checkEmployeeState();
  }

  // final DateFormat _formatter = DateFormat('dd-MM-yyyy');
  // final DateFormat _timeformat = DateFormat('hh:mm');
  Widget checkin() {
    setState(() {});
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return SignButton(
        screen: screen,
        width: screen ? width * 0.8 : height * 0.1,
        height: screen ? width * 0.14 : height * 0.1,
        txt: "Check in",
        txtColor: Colors.white,
        buttonColor: cb,
        borderColor: Colors.transparent,
        onPressed: () {
          getdistance();
          _sign();

          isEnable == true
              ? setState(() {
                  isDisplayCard = true;
                  checkIn = DateTime.now();
                  _getCurrentLocation();
                  isCheckIn = true;
                  _employeeIn = !_employeeIn;
                })
              : showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Check in failed"),
                      content: Text(
                          "You are far away from office.Go to office for Check in."),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Close"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  });
        });

    print(_currentPosition.latitude);
  }

  Widget card() {
    return Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.location_on),
              ),
              Expanded(
                  child: Text(
                      "You ${isCheckIn ? "check in" : "check out"} at ${isCheckIn ? checkIn : checkOut} $_currentAddress")),
            ],
          ),
        ));
  }

  Widget checkout() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;

    return SignButton(
        screen: screen,
        width: screen ? width * 0.8 : height * 0.1,
        height: screen ? width * 0.14 : height * 0.1,
        txt: "Check out",
        txtColor: Colors.white,
        buttonColor: Colors.red,
        borderColor: Colors.transparent,
        onPressed: () {
          _sign();
          isEnable == true
              ? setState(() {
                  _getCurrentLocation();
                  checkOut = DateTime.now();
                  isCheckIn = false;
                  _employeeIn = !_employeeIn;
                })
              : showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Check out failed"),
                      content: Text("Please go back to office for checkout"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Close"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  });

          print(_currentPosition.latitude);
        });
    // }
  }

  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      final MarkerId mId = MarkerId("1");
      LatLng currentLatLng = LatLng(position.latitude, position.longitude);
      final Marker marker = Marker(
          markerId: mId,
          position: currentLatLng,
          infoWindow: InfoWindow(title: "You're here", snippet: ""));
      setState(() {
        _currentPosition = position;
        markers[mId] = marker;
      });
      mapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: currentLatLng, zoom: 17)));
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.name}, ${place.street}, ${place.locality}, ${place.administrativeArea},${place.country}";
        print(_currentAddress);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
            backgroundColor: cb,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back)),
            title: Text("Location"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: _checkEmployeeState,
              ),
            ]),
        body: Stack(
          children: [
            Container(
              width: width,
              height: height,
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 70),
                  child: GoogleMap(
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                      mapController = controller;
                      _getCurrentLocation();
                    },
                    markers: Set<Marker>.of(markers.values),
                  )),
            ),
            isDisplayCard ? card() : Container(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: _employeeIn ? checkout() : checkin()),
            )
          ],
        ));
  }

  void _checkEmployeeState() async {
    // It checks the employee state
    final prefs = await SharedPreferences.getInstance();
    _client = new OdooClient((prefs.getString("Odoo_URL") ?? ""));
    _client
        .authenticate(prefs.getString("User_Name"), prefs.getString("Password"),
            prefs.getString("Odoo_Database"))
        .then((auth) {
      if (auth.isSuccess) {
        // The hr_employee Object is the one who register the attendance
        _client.searchRead("hr.employee", [
          ["user_id", "=", auth.getUser().uid],
          // ["name", "=", auth.getUser().name]
        ], [
          "id",
          "attendance_state",
          // "name"
        ]).then((employeeResult) {
          if (!employeeResult.hasError()) {
            var employeeState =
                employeeResult.getResult()["records"][0]["attendance_state"];
            // name = employeeState.getResult()["records"][0]["name"];
            if (employeeState == "checked_in") {
              setState(() {
                _employeeIn = true;
              });
            } else {
              setState(() {
                _employeeIn = false;
              });
            }
          }
        });
      }
    }).catchError((e) {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => SettingsPage(title: "Settings")));
    });
  }

  void _sign() async {
    final prefs = await SharedPreferences.getInstance();
    _client = new OdooClient((prefs.getString("Odoo_URL") ?? ""));

    _client
        .authenticate(prefs.getString("User_Name"), prefs.getString("Password"),
            prefs.getString("Odoo_Database"))
        .then((auth) {
      if (auth.isSuccess) {
        // The hr_employee Object is the one who register the attendance
        _client.searchRead("hr.employee", [
          ["user_id", "=", auth.getUser().uid],
          // ["name", "=", auth.getUser().name]
        ], [
          "id",
        ]).then((employeeResult) {
          if (!employeeResult.hasError()) {
            var _employee = employeeResult.getResult()["records"][0]["id"];
            // name = employeeResult.getResult()["records"][0]["name"];
            // Call the attendance_manual method that will do the rest in server side
            _client.callKW("hr.employee", "attendance_manual", [
              _employee,
              "hr_attendance.hr_attendance_action_my_attendances"
            ]).then((kwResult) {
              if (!kwResult.hasError()) {
                setState(() {
                  // _employeeIn = !_employeeIn;
                });
              }
            });
          }
        });
      }
    });
  }
}
