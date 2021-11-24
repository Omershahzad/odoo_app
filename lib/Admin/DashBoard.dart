import 'package:flutter/material.dart';
import 'package:odoo_client/Admin/AddEmployees.dart';
import 'package:odoo_client/Admin/TimeOff/timeoff.dart';
import 'package:odoo_client/Admin/payroll.dart';
import 'package:odoo_client/app/pages/home.dart';
import 'package:odoo_client/app/pages/settings.dart';
import 'package:odoo_client/employee_ui/screens/chat_screen.dart';
import 'package:odoo_client/employee_ui/screens/chat_test.dart';
import 'package:odoo_client/utilis/colors.dart';
import 'package:odoo_client/utilis/images.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:odoo_client/auth/settings.dart';

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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ChatScreen()));
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
      color: c5,
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
      backgroundColor: c5,
      appBar: AppBar(
        backgroundColor: c3,
        iconTheme: IconThemeData(color: Colors.white),
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
                style: TextStyle(color: c3),
              ),
              accountEmail: Text("farhanrashad-ddc14-flutter-1728136",
                  style: TextStyle(color: Colors.black)),
              decoration: BoxDecoration(color: Colors.white),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: ListTile(
                title: Text("Employees", style: TextStyle(color: c3)),
                leading: Icon(Icons.person, color: c3),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PayRoll()));
              },
              child: ListTile(
                title: Text('Pay Slip', style: TextStyle(color: c3)),
                leading: Icon(Icons.payment, color: c3),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Projects', style: TextStyle(color: c3)),
                leading: Icon(Icons.pages_rounded, color: c3),
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
                title: Text("Settings", style: TextStyle(color: c3)),
                leading: Icon(Icons.settings, color: c3),
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
                title: Text("Logout", style: TextStyle(color: c3)),
                leading: Icon(Icons.help, color: c3),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, top: 25),
        child: SingleChildScrollView(
          child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(avatar),
                    radius: 25.0,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Hi, ',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            'Mitchell Admin',
                            style: TextStyle(
                                color: Colors.white,
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
                height: 50,
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
                                    builder: (context) => Home()));
                          },
                          child: Card(
                            elevation: 15,
                            color: c3,
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
                            color: c3,
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
                            color: c3,
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
                          color: c3,
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
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(6.0),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          elevation: 20.0,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddEmployee()));
          },
          child: Icon(
            Icons.add,
            color: c5,
            size: 28,
          ),
        ),
      ),
    );
  }
}
