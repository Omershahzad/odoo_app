import 'package:flutter/material.dart';
import 'package:odoo_client/utilis/colors.dart';
import 'package:odoo_client/widget/button.dart';

class AddEmployee extends StatefulWidget {
  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  int selectedRadio = 1;
  Widget selectedWidget;
  int r;
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cg,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Add Employee"),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: constraints.maxWidth,
                      minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  gapPadding: 2,
                                  borderSide: BorderSide(color: cg)),
                              labelText: "First Name",
                              labelStyle: TextStyle(fontSize: 12, color: cg),
                              prefixIcon: Icon(
                                Icons.person,
                                color: cg,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: cg)),
                              labelText: "Last Name",
                              labelStyle: TextStyle(fontSize: 12, color: cg),
                              prefixIcon: Icon(
                                Icons.person,
                                color: cg,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: cg)),
                              labelText: "Mobile Number*",
                              labelStyle: TextStyle(fontSize: 12, color: cg),
                              prefixIcon: Icon(
                                Icons.phone,
                                color: cg,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: cg)),
                              labelText: "Email*",
                              labelStyle: TextStyle(fontSize: 12, color: cg),
                              prefixIcon: Icon(
                                Icons.email,
                                color: cg,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: cg)),
                              labelText: "Designation*",
                              labelStyle: TextStyle(fontSize: 12, color: cg),
                              prefixIcon: Icon(
                                Icons.workspaces_filled,
                                color: cg,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: cg)),
                              labelText: "Password*",
                              labelStyle: TextStyle(fontSize: 12, color: cg),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: cg,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )));
        },
      )

      // Padding(
      //   padding: const EdgeInsets.only(top: 20, left: 10),
      //   child: Row(
      //     children: [
      //       Icon(
      //         Icons.assignment_turned_in,
      //         color: admin_color,
      //       ),
      //       SizedBox(
      //         width: 10,
      //       ),
      //       Text(
      //         "Designation",
      //         style: TextStyle(fontSize: 12, color: admin_color),
      //       )
      //     ],
      //   ),
      // ),
      // Padding(
      //   padding: const EdgeInsets.only(left: 40),
      //   child: Row(
      //     children: [
      //       Radio(
      //           value: 2,
      //           groupValue: selectedRadio,
      //           activeColor: admin_color,
      //           onChanged: (val) {
      //             print("Radio $val");
      //             setState(() {
      //               r = 2;
      //             });
      //             setSelectedRadio(val);
      //           }),
      //       Text("Employee"),
      //       Radio(
      //           value: 1,
      //           groupValue: selectedRadio,
      //           activeColor: admin_color,
      //           onChanged: (val) {
      //             setState(() {
      //               r = 1;
      //             });
      //             print("Radio $val");
      //             setSelectedRadio(val);
      //           }),
      //       Text("Manager"),
      //     ],
      //   ),
      // ),
      // SizedBox(
      //   height: 12,
      // ),
      // Padding(
      //   padding: const EdgeInsets.only(top: 20, left: 10),
      //   child: Row(
      //     children: [
      //       Icon(
      //         Icons.access_time,
      //         color: admin_color,
      //       ),
      //       SizedBox(
      //         width: 10,
      //       ),
      //       Text(
      //         "Shift timmings",
      //         style: TextStyle(fontSize: 12, color: admin_color),
      //       )
      //     ],
      //   ),
      // ),
      // Padding(
      //   padding: const EdgeInsets.only(left: 50),
      //   child: Row(
      //     children: [
      //       Container(
      //           width: width * 0.3,
      //           child: TextFormField(
      //             decoration: InputDecoration(
      //                 labelText: 'Off time',
      //                 labelStyle:
      //                     TextStyle(fontSize: 12, color: admin_color),
      //                 contentPadding: EdgeInsets.zero),
      //           )),
      //       Padding(
      //         padding:
      //             const EdgeInsets.only(top: 10, left: 10, right: 10),
      //         child: Text("to"),
      //       ),
      //       Container(
      //           width: width * 0.3,
      //           child: TextFormField(
      //             decoration: InputDecoration(
      //                 labelText: 'StartTime',
      //                 labelStyle:
      //                     TextStyle(fontSize: 12, color: admin_color),
      //                 contentPadding: EdgeInsets.zero),
      //           )),
      //     ],
      //   ),
      // ),
      // SizedBox(
      //   height: 15,
      // ),
      // TextField(
      //   decoration: InputDecoration(
      //     labelText: "Employee ID (if availble)",
      //     labelStyle: TextStyle(fontSize: 12),
      //     prefixIcon: Icon(
      //       Icons.phone,
      //       color: admin_color,
      //     ),
      //   ),
      // ),

      ,
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Container(
          width: width,
          child: SignButton(
              screen: screen,
              width: screen ? width * 0.8 : height * 0.1,
              height: screen ? width * 0.14 : height * 0.1,
              txt: "Add",
              txtColor: Colors.white,
              buttonColor: cg,
              borderColor: cg,
              onPressed: () {}),
        ),
      ),
    );
  }
}
