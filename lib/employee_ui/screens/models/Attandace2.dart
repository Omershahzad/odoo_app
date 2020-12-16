import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:odoo_client/utilis/colors.dart';
import 'package:odoo_client/widget/button.dart';
import 'package:slider_button/slider_button.dart';

class GeolocatorWork extends StatefulWidget {
  // static  createPage() {
  //   return(Icons.location_on, (context) => GeolocatorWidget());
  // }

  @override
  _GeolocatorWidgetState createState() => _GeolocatorWidgetState();
}

class _GeolocatorWidgetState extends State<GeolocatorWork> {
  DateTime checkIn;
  DateTime checkOut;
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

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.502019, 74.353282),
    zoom: 20.4746,
  );

  Completer<GoogleMapController> _controller = Completer();
  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(31.502019, 74.353282),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);
  String _currentAddress;

  // final List<_PositionItem> _positionItems = <_PositionItem>[];
  // StreamSubscription<Position> _positionStreamSubscription;
  // var first;
  // Position _currentPosition;
  // String _currentAddress;
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

          isEnable == true
              ? setState(() {
                  isDisplayCard = true;
                  checkIn = DateTime.now();
                  _getCurrentLocation();
                  isCheckIn = true;
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

          print(_currentPosition.latitude);
        });
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

  // Widget card2() {
  //   // setState(() {});
  //   return Card(
  //       elevation: 10,
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //         child: Row(
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: Icon(Icons.location_on),
  //             ),
  //             Expanded(
  //                 child:
  //                     Text("You checked out at $checkOut $_currentAddress  ")),
  //           ],
  //         ),
  //       ));
  // }
  Widget checkout() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    // if (isPressed == checkin()) {
    //   Future.delayed(Duration(seconds: 5), () {
    //     checkout();
    //   });
    // } else {
    return SignButton(
        screen: screen,
        width: screen ? width * 0.8 : height * 0.1,
        height: screen ? width * 0.14 : height * 0.1,
        txt: "Check out",
        txtColor: Colors.white,
        buttonColor: Colors.red,
        borderColor: Colors.transparent,
        onPressed: () {
          isEnable == true
              ? setState(() {
                  _getCurrentLocation();
                  checkOut = DateTime.now();
                  isCheckIn = false;
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

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
//   _getAddressFromLatLng() async {
//     try {
//       final coordinates = new Coordinates(31.50, 74.35);
//       var addresses =
//           await Geocoder.local.findAddressesFromCoordinates(coordinates);
//       first = addresses.first.addressLine;

//       print("${first.featureName} : ${first.addressLine}");
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   void dispose() {
//     if (_positionStreamSubscription != null) {
//       _positionStreamSubscription.cancel();
//       _positionStreamSubscription = null;
//     }

//     super.dispose();
//   }
// }
// enum _PositionItemType {
//   permission,
//   position,
// }

// class _PositionItem {
//   _PositionItem(this.type, this.displayValue);

//   final _PositionItemType type;
//   final String displayValue;

  // @override
  // void initState() {
  //   super.initState();
  //   _getCurrentLocation();
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // double l = MediaQuery.of(context).size.longestSide;
    // Orientation orien = MediaQuery.of(context).orientation;
    // bool screen = orien == Orientation.portrait ? true : false;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: cb,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          title: Text("Location"),
        ),
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
                  child: !isCheckIn ? checkin() : checkout()),
            ),
            Positioned(top: 80, child: slide2())
            // Align(
            //     alignment: Alignment.centerLeft,
            //     child: RaisedButton(
            //       onPressed: () {
            //         // getdistance();
            //       },
            //     )),
            // Align(
            //     alignment: Alignment.centerRight, child: Text(dist.toString()))
          ],
        )

        // Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       SizedBox(
        //         height: 20,
        //       ),
        //       if (_currentPosition != null)
        //         Card(
        //             elevation: 10,
        //             child: Padding(
        //               padding: const EdgeInsets.symmetric(
        //                   horizontal: 50, vertical: 10),
        //               child: Text(_currentAddress),
        //             )),
        //       Spacer(),
        //       Container(
        //         width: width,
        //         height: 400,
        //         child: GoogleMap(
        //           mapType: MapType.normal,
        //           initialCameraPosition: _kGooglePlex,
        //           onMapCreated: (GoogleMapController controller) {
        //             _controller.complete(controller);
        //           },
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.symmetric(vertical: 15),
        //         child: SignButton(
        //             screen: screen,
        //             width: screen ? width * 0.8 : height * 0.1,
        //             height: screen ? width * 0.14 : height * 0.1,
        //             txt: "Get Location",
        //             txtColor: Colors.white,
        //             buttonColor: Colors.blue,
        //             borderColor: Colors.transparent,
        //             onPressed: () {
        //               _getCurrentLocation();
        //               print(_currentPosition.latitude);
        //             }),
        //       ),
        //     ],
        //   ),
        // ),
        );
    // return Scaffold(
    //   backgroundColor: Theme.of(context).backgroundColor,
    //   body: ListView.builder(
    //     itemCount: _positionItems.length,
    //     itemBuilder: (context, index) {
    //       final positionItem = _positionItems[index];

    //       if (positionItem.type == _PositionItemType.permission) {
    //         return ListTile(
    //           title: Text(first,
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                 color: Colors.black,
    //                 fontWeight: FontWeight.bold,
    //               )),
    //         );
    //       } else {
    //         return Card(
    //           child: ListTile(
    //             title: Text(
    //               first,
    //               style: TextStyle(color: Colors.black),
    //             ),
    //           ),
    //         );
    //       }
    //     },
    //   ),
    //   floatingActionButton: Stack(
    //     children: <Widget>[
    //       Positioned(
    //         bottom: 80.0,
    //         right: 10.0,
    //         child: FloatingActionButton.extended(
    //           onPressed: () async {
    //             await Geolocator.getLastKnownPosition().then((value) => {
    //                   _positionItems.add(_PositionItem(
    //                       _PositionItemType.position, value.toString()))
    //                 });

    //             setState(
    //               () {},
    //             );
    //           },
    //           label: Text("getLastKnownPosition"),
    //         ),
    //       ),
    //       Positioned(
    //         bottom: 10.0,
    //         right: 10.0,
    //         child: FloatingActionButton.extended(
    //             onPressed: () async {
    //               await Geolocator.getCurrentPosition(
    //                       desiredAccuracy: LocationAccuracy.best)
    //                   .then((value) => {
    //                         _positionItems.add(_PositionItem(
    //                             _PositionItemType.position, value.toString())),
    //                         //   Text(value.toString())
    //                       });
    //               _getAddressFromLatLng();
    //               setState(
    //                 () {},
    //               );
    //             },
    //             label: Text("getCurrentPosition")),
    //       ),
    //       Positioned(
    //         bottom: 220.0,
    //         right: 10.0,
    //         child: FloatingActionButton.extended(
    //           onPressed: () => setState(_positionItems.clear),
    //           label: Text("clear positions"),
    //         ),
    //       ),
    //       Positioned(
    //         bottom: 290.0,
    //         right: 10.0,
    //         child: FloatingActionButton.extended(
    //           onPressed: () async {
    //             await Geolocator.checkPermission().then((value) => {
    //                   _positionItems.add(_PositionItem(
    //                       _PositionItemType.permission, value.toString()))
    //                 });
    //             setState(() {});
    //           },
    //           label: Text("getPermissionStatus"),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget slide1() {
    return SliderButton(
      action: () {
        ///Do something here
      },
      shimmer: true,
      label: Text(
        "Slide to CHECK IN",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 17),
      ),
      width: 250,
      buttonSize: 50,
      radius: 100,
      height: 60,
      buttonColor: Colors.white,
      backgroundColor: cb,
      highlightedColor: Colors.blue,
      baseColor: Colors.white,
      icon: Icon(
        Icons.arrow_forward,
        color: Colors.grey,
      ),
    );
  }

  Widget slide2() {
    return SliderButton(
      action: () {},
      shimmer: true,
      label: Text(
        "Slide to CHECK OUT",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 17),
      ),
      width: 250,
      buttonSize: 50,
      radius: 100,
      height: 60,
      buttonColor: Colors.white,
      backgroundColor: Colors.red,
      highlightedColor: Colors.blue,
      baseColor: Colors.white,
      icon: Icon(
        Icons.arrow_forward,
        color: Colors.grey,
      ),
    );
  }
}
