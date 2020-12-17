import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odoo_client/Admin/TimeOff/Everyone.dart';
import 'package:odoo_client/Admin/TimeOff/ManagersAllocations.dart';
import 'package:odoo_client/Admin/TimeOff/ManagersTimeoff.dart';
import 'package:odoo_client/Admin/TimeOff/MyTimeOffAllocation.dart';
import 'package:odoo_client/Admin/TimeOff/MyTimeOffRequest.dart';
import 'package:odoo_client/Admin/payroll.dart';
import 'package:odoo_client/app/pages/home.dart';
import 'package:odoo_client/utilis/colors.dart';

class Timeoff extends StatefulWidget {
  @override
  _TimeoffState createState() => _TimeoffState();
}

class _TimeoffState extends State<Timeoff> {
  bool isSearchButtonPressed = false;
  List<String> _options = [
    'My Time Off Requests',
    'My Allocation Requests'
  ]; // Option 2
  String _selected;
  List<String> _options1 = ['Time OFF', 'Allocations']; // Option 2
  String _selected1;

  @override
  Widget _appbar() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        SizedBox(
          width: width * 0.38,
        ),
        Text("Time Off",
            style: GoogleFonts.raleway(
                fontSize: 18, fontWeight: FontWeight.bold, color: cg)),
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Color(0xff875a7b),
          ),
        ),
        actions: [
          Container(
            width: width,
            child: isSearchButtonPressed ? _searchbar() : _appbar(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 70,
                  minHeight: 70,
                  maxWidth: width,
                  maxHeight: height,
                ),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: Card(
                    elevation: 15,
                    color: Colors.indigo[900],
                    shadowColor: Colors.indigo,
                    child: Container(
                      height: height * 0.1,
                      width: width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: DropdownButton(
                          dropdownColor: Colors.indigo[900],
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Icon(
                              Icons.access_time_sharp,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),

                          hint: Center(
                            child: Text('MY TIME OFF',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17)),
                          ), // Not necessary for Option 1
                          value: _selected,
                          onChanged: (newValue) {
                            setState(() {
                              _selected = newValue;
                            });

                            if (_selected == "My Time Off Requests") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TimeRequest()));
                            }
                            if (_selected == "My Allocation Requests") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TimeAllocation()));
                            }
                          },
                          items: _options.map((option) {
                            return DropdownMenuItem(
                              child: new Text(option,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17)),
                              value: option,
                            );
                          }).toList(),
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
                  maxWidth: width,
                  maxHeight: height,
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
                    color: Colors.indigo[300],
                    shadowColor: Colors.indigo,
                    child: Container(
                      height: height * 0.1,
                      width: width * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: DropdownButton(
                          dropdownColor: Colors.indigo[300],
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 130),
                            child: Icon(
                              Icons.access_time_sharp,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),

                          hint: Center(
                            child: Text('MANAGERS',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17)),
                          ), // Not necessary for Option 1
                          value: _selected1,
                          onChanged: (newValue) {
                            setState(() {
                              _selected1 = newValue;
                            });

                            if (_selected1 == "Time OFF") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ManagersTimeoff()));
                            }
                            if (_selected1 == "Allocations") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ManagerAllocations()));
                            }
                          },
                          items: _options1.map((option) {
                            return DropdownMenuItem(
                              child: new Text(option,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17)),
                              value: option,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
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
                        maxWidth: width,
                        maxHeight: height,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Everyone()));
                        },
                        child: Card(
                          elevation: 15,
                          color: Colors.indigo[100],
                          shadowColor: Colors.indigo,
                          child: Container(
                            width: width * 0.8,
                            height: height * 0.1,
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
                                  Text(
                                    "Everyone".toUpperCase(),
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
