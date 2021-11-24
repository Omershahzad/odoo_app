import 'package:flutter/material.dart';
import 'package:odoo_client/auth/index.dart';
import 'package:odoo_client/utilis/colors.dart';
import 'package:odoo_client/utilis/images.dart';

import '../../base.dart';
import '../data/services/odoo_response.dart';
import '../utility/constant.dart';
import '../utility/strings.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends Base<ProfilePage> {
  String name = "";
  String image_URL = "";
  String email = "";
  var phone = "";
  var mobile = "";
  var street = "";
  var street2 = "";
  var city = "";
  var state_id = "";
  var zip = "";
  var title = "";
  var website = "";
  var jobposition = "";

  _getUserData() async {
    isConnected().then((isInternet) {
      if (isInternet) {
        odoo.searchRead(Strings.res_users, [
          ["id", "=", getUID()]
        ], []).then(
          (OdooResponse res) {
            if (!res.hasError()) {
              setState(() {
                String session = getSession();
                session = session.split(",")[0].split(";")[0];
                final result = res.getResult()['records'][0];
                name = result['name'] is! bool ? result['name'] : "";
                image_URL = getURL() +
                    "/web/image?model=res.users&field=image1920&" +
                    session +
                    "&id=" +
                    getUID().toString();
                email = result['email'] is! bool ? result['email'] : "";
              });
            } else {
              showMessage("Warning", res.getErrorMessage());
            }
          },
        );
      }
    });
  }

  _clearPrefs() async {
    odoo.destroy();
    preferences.remove(Constants.USER_PREF);
    preferences.remove(Constants.SESSION);
    pushAndRemoveUntil(SettingsPage());
  }

  _getProfileData() async {
    isConnected().then((isInternet) {
      if (isInternet) {
        odoo.searchRead("res.partner", [
          ["id", "=", user.result.partnerId] //model
        ], []).then(
          (OdooResponse res) {
            if (!res.hasError()) {
              setState(() {
                final result = res.getResult()['records'][0];
                phone = result['phone'] is! bool ? result['phone'] : "N/A";
                mobile = result['mobile'] is! bool ? result['mobile'] : "N/A";
                street = result['street'] is! bool ? result['street'] : "";
                street2 = result['street2'] is! bool ? result['street2'] : "";
                city = result['city'] is! bool ? result['city'] : "";
                state_id =
                    result['state_id'] is! bool ? result['state_id'][1] : "";
                zip = result['zip'] is! bool ? result['zip'] : "";
                title = result['title'] is! bool ? result['title'][1] : "N/A";
                website =
                    result['website'] is! bool ? result['website'] : "N/A";
                jobposition =
                    result['function'] is! bool ? result['function'] : "N/A";
              });
            }
          },
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();

    getOdooInstance().then((odoo) {
      _getUserData();
      _getProfileData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final upper_header = Column(
      children: [
        Stack(
          children: [
            Container(
              height: 170,
              color: c5,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          x_logo,
                        )),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 90),
                      child: new Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(70.0),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://st4.depositphotos.com/4329009/19956/v/600/depositphotos_199564354-stock-illustration-creative-vector-illustration-default-avatar.jpg"),
                          ),
                        ),
                      ),
                    ),
                    // new Container(
                    //   width: 150.0,
                    //   height: 150.0,
                    //   padding: EdgeInsets.all(10.0),
                    //   margin: EdgeInsets.all(25.0),
                    //   decoration: new BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     boxShadow: [
                    //       BoxShadow(
                    //         blurRadius: 25.0,
                    //         color: Colors.white,
                    //       )
                    //     ],
                    //     image: new DecorationImage(
                    //       fit: BoxFit.fill,
                    //       image: new NetworkImage(
                    //         image_URL != null
                    //             ? image_URL
                    //             : "https://i1.wp.com/www.molddrsusa.com/wp-content/uploads/2015/11/profile-empty.png.250x250_q85_crop.jpg?ssl=1",
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Montserrat",
                          color: cg,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        email,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: "Montserrat",
                          color: cg,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 20,
          child: new DefaultTabController(
            length: 5,
            child: new TabBar(
              tabs: [
                new Text("Personal", style: TextStyle(color: Colors.black)),
                new Text("Resume", style: TextStyle(color: Colors.black)),
                new Text("Work Information",
                    style: TextStyle(color: Colors.black)),
                new Text("Private information",
                    style: TextStyle(color: Colors.black)),
                new Text("Account Security",
                    style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ),
      ],
    );

    final lower = Container(
      child: ListView(
        children: <Widget>[
          Card(
            child: Container(
              height: 75,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(right: 10.0)),
                  Icon(Icons.person_pin),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Text(
                    jobposition,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              height: 75,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(right: 10.0)),
                  Icon(Icons.title, color: Colors.black),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              height: 75,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(right: 10.0)),
                  Icon(Icons.web_asset, color: Colors.black),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Text(
                    website,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              height: 75,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(right: 10.0)),
                  Icon(Icons.phone_android, color: Colors.black),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Text(
                    mobile,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              height: 75,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(right: 10.0)),
                  Icon(Icons.phone, color: Colors.black),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Text(
                    phone,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(right: 10.0)),
                  Icon(Icons.location_city),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Container(
                    padding: EdgeInsets.only(left: 10.0, bottom: 9.0, top: 9.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          street,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: "Montserrat",
                          ),
                        ),
                        Text(
                          city,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: "Montserrat",
                          ),
                        ),
                        Text(
                          state_id,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: "Montserrat",
                          ),
                        ),
                        Text(
                          zip,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      key: scaffoldKey,
      // appBar: AppBar(
      //   backgroundColor: Color(0xff875a7b),
      //   title: Text("Profile"),
      //   actions: <Widget>[
      //     IconButton(
      //         icon: Icon(Icons.exit_to_app),
      //         onPressed: () {
      //           showDialog(
      //             context: context,
      //             barrierDismissible: false,
      //             builder: (BuildContext ctxt) {
      //               return AlertDialog(
      //                 title: Text(
      //                   "Logged Out",
      //                   style: TextStyle(
      //                     fontFamily: "Montserrat",
      //                     fontSize: 22,
      //                     fontWeight: FontWeight.bold,
      //                     color: Colors.black,
      //                   ),
      //                 ),
      //                 content: Text(
      //                   "Are you sure you want to logged out?",
      //                   style: TextStyle(
      //                     fontFamily: "Montserrat",
      //                     fontSize: 18,
      //                     color: Colors.black,
      //                   ),
      //                 ),
      //                 actions: <Widget>[
      //                   FlatButton(
      //                     onPressed: () {
      //                       Navigator.pop(context);
      //                     },
      //                     child: Text(
      //                       "Cancel",
      //                       style: TextStyle(
      //                         fontFamily: "Montserrat",
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ),
      //                   FlatButton(
      //                     onPressed: () {
      //                       _clearPrefs();
      //                     },
      //                     child: Text(
      //                       "Logout",
      //                       style: TextStyle(
      //                         fontFamily: "Montserrat",
      //                         fontWeight: FontWeight.bold,
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               );
      //             },
      //           );
      //         })
      //   ],
      // ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300),
        child: upper_header,
      ),

      body:
          // new TabBarView(
          //   children: <Widget>[
          //     new Column(
          //       children: <Widget>[new Text("Lunches Page")],
          //     ),
          //     new Column(
          //       children: <Widget>[new Text("Cart Page")],
          //     )
          //   ],
          // ),

          Column(
        children: <Widget>[Expanded(child: lower)],
      ),
    );
  }
}
