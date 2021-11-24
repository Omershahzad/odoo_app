import 'package:flutter/material.dart';
import 'package:odoo_client/app/pages/profile.dart';
import 'package:odoo_client/auth/settings.dart';
import 'package:odoo_client/employee_ui/screens/chat_screen.dart';
import 'package:odoo_client/utilis/colors.dart';
import 'package:odoo_client/utilis/images.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Attendance.dart';
import 'chat_test.dart';
import 'leaves.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // User user = FirebaseAuth.instance.currentUser;

  bool isSearchButtonPressed = false;
  @override
  Widget _appbar() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        SizedBox(
          width: width * 0.34,
        ),
        Text(
          "Dynexcel",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: width * 0.21,
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

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: c5,
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            Container(
              width: width,
              child: isSearchButtonPressed ? _searchbar() : _appbar(),
            ),
          ],
        ),
        drawer: Drawer(
          elevation: 20,
          child: ListView(
            children: [
              new UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(avatar),
                ),
                accountName: Text('Demo'),
                accountEmail: Text("demo@gmail.com"),
                decoration: BoxDecoration(color: c5, shape: BoxShape.rectangle),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                child: ListTile(
                  title: Text('Profile'),
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
                      MaterialPageRoute(builder: (context) => Leaves()));
                },
                child: ListTile(
                  title: Text('Time Off'),
                  leading: Icon(Icons.access_time),
                ),
              ),
              InkWell(
                onTap: () {},
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
                onTap: () {},
                child: ListTile(
                  title: Text("About"),
                  leading: Icon(Icons.help),
                ),
              ),
              InkWell(
                onTap: () async {
                  // await FirebaseAuth.instance.signOut();
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.clear();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()));
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
          padding: const EdgeInsets.only(left: 25, top: 10),
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
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Hi, ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            Text(
                              "Marc Demo",
                              style: TextStyle(
                                  color: Colors.black,
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
                  height: 20,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              GeolocatorWidget()));
                                },
                                child: Card(
                                  elevation: 15,
                                  color: c3,
                                  child: Container(
                                    width: 130,
                                    height: 130,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                            "attendance".toUpperCase(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
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
                                    width: 130,
                                    height: 130,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                            "Advance".toUpperCase(),
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
                              child: GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Timeoff()));
                                },
                                child: Card(
                                  elevation: 15,
                                  color: c3,
                                  child: Container(
                                    width: 130,
                                    height: 130,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 15,
                                color: c3,
                                shadowColor: Colors.blueGrey,
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => PayRoll()));
                                  },
                                  child: Container(
                                    width: 130,
                                    height: 130,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                              child: GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Timeoff()));
                                },
                                child: Card(
                                  elevation: 15,
                                  color: c3,
                                  child: Container(
                                    width: 130,
                                    height: 130,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.money,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "loan".toUpperCase(),
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 15,
                                color: c3,
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => PayRoll()));
                                  },
                                  child: Container(
                                    width: 130,
                                    height: 130,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.message,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            "Messages".toUpperCase(),
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
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.all(6.0),
        //   child: FloatingActionButton(
        //     backgroundColor: cb,
        //     onPressed: () {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => TaskCreation()));
        //     },
        //     child: Icon(Icons.add),
        //   ),
      ),
    );
  }
}
