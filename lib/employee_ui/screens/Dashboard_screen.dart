import 'package:flutter/material.dart';
import 'package:odoo_client/app/pages/login.dart';
import 'package:odoo_client/auth/settings.dart';
import 'package:odoo_client/employee_ui/screens/chat_screen.dart';
import 'package:odoo_client/utilis/colors.dart';
import 'package:odoo_client/utilis/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Attendance.dart';

import 'TaskCreation_screen.dart';
import 'leaves.dart';
import 'wellcome_screen.dart';

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
                  context, MaterialPageRoute(builder: (context) => ChatUI()));
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
      color: cb,
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110),
          child: AppBar(
            backgroundColor: cb,
            actions: [
              Container(
                width: width,
                child: isSearchButtonPressed ? _searchbar() : _appbar(),
              ),
            ],
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.white,
              labelStyle: TextStyle(
                fontSize: 15,
              ),
              tabs: [
                Tab(
                  text: "Queue",
                ),
                Tab(
                  text: "Ongoing",
                ),
                Tab(
                  text: "Closed",
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              new UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(avatar),
                ),
                accountName: Text('Umar Shahzad'),
                accountEmail: Text("umarg569@gmail.com"),
                decoration: BoxDecoration(color: cb),
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
        body: TabBarView(
          children: [
            Container(
              child: Center(
                child: Text("To do task will display here"),
              ),
            ),
            Container(
              child: Center(
                child: Text("In progress task will display here"),
              ),
            ),
            Container(
              child: Center(
                child: Text("Completed task will display here"),
              ),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(6.0),
          child: FloatingActionButton(
            backgroundColor: cb,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TaskCreation()));
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
