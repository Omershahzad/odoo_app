import 'package:flutter/material.dart';
import 'package:odoo_client/Admin/Employee_detail.dart';
import 'package:odoo_client/utilis/colors.dart';
import 'package:odoo_client/utilis/images.dart';
import 'package:odoo_client/widget/button.dart';

import 'AddEmployees.dart';

class EmployeeScreen extends StatefulWidget {
  @override
  _EmployeeScreenState createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  bool isSearchButtonPressed = false;
  @override
  Widget _appbar() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        SizedBox(
          width: width * 0.32,
        ),
        Text(
          "Employees",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          width: width * 0.20,
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
        SizedBox(
          width: width * 0.04,
        ),
        InkWell(
            onTap: () {},
            child: Icon(
              Icons.receipt,
              color: Colors.white,
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

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cg,
        actions: [
          Container(
            width: width,
            child: isSearchButtonPressed ? _searchbar() : _appbar(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EmployeDetail()));
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatar),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Employee1",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        Text(
                          "employee1@gmail.com",
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EmployeDetail()));
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatar),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Employee2",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        Text(
                          "employee2@gmail.com",
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EmployeDetail()));
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatar),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Employee3",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        Text(
                          "employee3@gmail.com",
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EmployeDetail()));
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatar),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Employee4",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        Text(
                          "employee4@gmail.com",
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EmployeDetail()));
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(avatar),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Employee5",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                        Text(
                          "employee5@gmail.com",
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            SignButton(
                screen: screen,
                width: screen ? width * 0.8 : height * 0.1,
                height: screen ? width * 0.14 : height * 0.1,
                txt: "Add employees",
                txtColor: Colors.white,
                buttonColor: cg,
                borderColor: cg,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddEmployee()));
                }),
          ],
        ),
      ),
    );
  }
}
