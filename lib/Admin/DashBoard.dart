import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odoo_client/Admin/AddEmployees.dart';
import 'package:odoo_client/Admin/payroll.dart';
import 'package:odoo_client/app/pages/home.dart';
import 'package:odoo_client/app/pages/login.dart';
import 'package:odoo_client/app/utility/constant.dart';
import 'package:odoo_client/utilis/colors.dart';
import 'package:odoo_client/utilis/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../employee_ui/screens/Attendance.dart';
import '../employee_ui/screens/wellcome_screen.dart';
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
        Text("Admin",
            style:
                GoogleFonts.raleway(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(
          width: width * 0.22,
        ),
        InkWell(
            onTap: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => Wellcome()));
            },
            child: Icon(
              Icons.notifications,
              color: Colors.white,
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
              color: Colors.white,
            )),
      ],
    );
  }

  Widget _searchbar() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: admin_color,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Container(
            width: width * 0.9,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "search",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.search,
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
        backgroundColor: cg,
        actions: [
          Container(
            width: width,
            child: isSearchButtonPressed ? _searchbar() : _appbar(),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            new UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(avatar),
              ),
              accountName: Text('Mitchell Admin'),
              accountEmail: Text("farhanrashad-ddc14-flutter-1728136"),
              decoration: BoxDecoration(color: cg),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: ListTile(
                title: Text("Employees"),
                leading: Icon(Icons.person),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GeolocatorWidget()));
              },
              child: ListTile(
                title: Text("Attandace"),
                leading: Icon(Icons.view_module),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PayRoll()));
              },
              child: ListTile(
                title: Text('Pay Slip'),
                leading: Icon(Icons.payment),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Projects'),
                leading: Icon(Icons.pages_rounded),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings),
              ),
            ),
            InkWell(
              onTap: () async {
                // await FirebaseAuth.instance.signOut();
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Wellcome()));
              },
              child: ListTile(
                title: Text("Logout"),
                leading: Icon(Icons.help),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                          child: Container(
                            width: 140,
                            height: 140,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.group_outlined,
                                    color: cg,
                                    size: 30,
                                  ),
                                  Text(
                                    "Employees".toUpperCase(),
                                    style: TextStyle(
                                        color: cg,
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
                          child: Container(
                            width: 130,
                            height: 130,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.all_inclusive_outlined,
                                    color: cg,
                                    size: 30,
                                  ),
                                  Text(
                                    "Projects".toUpperCase(),
                                    style: TextStyle(
                                        color: cg,
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
                      child: Card(
                        elevation: 15,
                        child: Container(
                          width: 130,
                          height: 130,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.access_time_sharp,
                                  color: cg,
                                  size: 30,
                                ),
                                Text(
                                  "Time Off".toUpperCase(),
                                  style: TextStyle(
                                      color: cg,
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
                        child: Container(
                          width: 130,
                          height: 130,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.payment,
                                  color: cg,
                                  size: 30,
                                ),
                                Text(
                                  "Pay Slip".toUpperCase(),
                                  style: TextStyle(
                                      color: cg,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ],
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
          backgroundColor: cg,
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
