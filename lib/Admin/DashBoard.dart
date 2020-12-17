import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odoo_client/Admin/AddEmployees.dart';
import 'package:odoo_client/Admin/TimeOff/timeoff.dart';
import 'package:odoo_client/Admin/payroll.dart';
import 'package:odoo_client/app/pages/home.dart';
import 'package:odoo_client/app/pages/login.dart';
import 'package:odoo_client/app/pages/settings.dart';
import 'package:odoo_client/app/utility/constant.dart';
import 'package:odoo_client/utilis/colors.dart';
import 'package:odoo_client/utilis/images.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:odoo_client/auth/settings.dart';

import 'Employees_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  AdminHomeScreen({Key key}) : super(key: key);

  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  bool isSearchButtonPressed = false;

  @override
  Widget _appbar() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        SizedBox(
          width: width * 0.38,
        ),
        // Text("Admin",
        //     style: GoogleFonts.raleway(
        //         fontSize: 18, fontWeight: FontWeight.bold, color: cg)),
        SizedBox(
          width: width * 0.42,
        ),
        InkWell(
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => Wellcome()));
            },
            child: Icon(
              Icons.notifications,
              color: cg,
            )),
        SizedBox(
          width: width * 0.04,
        ),
        InkWell(
            onTap: () {
              setState(() {
                isSearchButtonPressed = true;
              });
            },
            child: Icon(
              Icons.search,
              color: cg,
            )),
      ],
    );
  }

  Widget _searchbar() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: cg,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Container(
            width: width * 0.9,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)), color: cg),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "search",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.search,
                    color: cg,
                  ),
                  suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isSearchButtonPressed = false;
                        });
                      },
                      child: Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.black,
                      ))),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: cg),
        actions: [
          Container(
            width: width,
            child: isSearchButtonPressed ? _searchbar() : _appbar(),
          ),
        ],
      ),
      drawer: Drawer(
        elevation: 11.0,
        child: ListView(
          children: [
            new UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(avatar),
              ),
              accountName: Text(
                'Mitchell Admin',
                style: TextStyle(color: cg),
              ),
              accountEmail: Text("farhanrashad-ddc14-flutter-1728136",
                  style: TextStyle(color: cg)),
              decoration: BoxDecoration(color: Colors.white),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: ListTile(
                title: Text("Employees", style: TextStyle(color: cg)),
                leading: Icon(Icons.person, color: cg),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PayRoll()));
              },
              child: ListTile(
                title: Text('Pay Slip', style: TextStyle(color: cg)),
                leading: Icon(Icons.payment, color: cg),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Projects', style: TextStyle(color: cg)),
                leading: Icon(Icons.pages_rounded, color: cg),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              },
              child: ListTile(
                title: Text("Settings", style: TextStyle(color: cg)),
                leading: Icon(Icons.settings, color: cg),
              ),
            ),
            InkWell(
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
              child: ListTile(
                title: Text("Logout", style: TextStyle(color: cg)),
                leading: Icon(Icons.help, color: cg),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, top: 25),
        child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(x_logo),
                  radius: 25.0,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Hi, ',
                          style: TextStyle(color: cg, fontSize: 18),
                        ),
                        Text(
                          'Mitchell Admin',
                          style: TextStyle(
                              color: cg,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      'Wellcome back',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 70,
                        minHeight: 70,
                        maxWidth: 150,
                        maxHeight: 150,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Card(
                          elevation: 15,
                          color: Colors.amber,
                          shadowColor: Colors.yellow,
                          child: Container(
                            width: 120,
                            height: 140,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.group_outlined,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Employees".toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 70,
                        minHeight: 70,
                        maxWidth: 150,
                        maxHeight: 150,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => EmployeeScreen()));
                        },
                        child: Card(
                          elevation: 15,
                          color: Colors.orange,
                          shadowColor: Colors.amber,
                          child: Container(
                            width: 120,
                            height: 140,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.all_inclusive_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Projects".toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 70,
                        minHeight: 70,
                        maxWidth: 150,
                        maxHeight: 150,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Timeoff()));
                        },
                        child: Card(
                          elevation: 15,
                          color: Colors.purple,
                          shadowColor: Colors.purple[700],
                          child: Container(
                            width: 120,
                            height: 140,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.access_time_sharp,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Time Off".toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 70,
                        minHeight: 70,
                        maxWidth: 150,
                        maxHeight: 150,
                      ),
                      child: Card(
                        elevation: 15,
                        color: Colors.blue[900],
                        shadowColor: Colors.blueGrey,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PayRoll()));
                          },
                          child: Container(
                            width: 120,
                            height: 140,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.payment,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Pay Slip".toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(6.0),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: cg,
          splashColor: cg,
          elevation: 20.0,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddEmployee()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
