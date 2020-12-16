import 'package:flutter/material.dart';
import 'package:odoo_client/Admin/Employee_checkDetail.dart';
import 'package:odoo_client/utilis/colors.dart';

class EmployeDetail extends StatefulWidget {
  EmployeDetail({Key key}) : super(key: key);

  @override
  _EmployeDetailState createState() => _EmployeDetailState();
}

class _EmployeDetailState extends State<EmployeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cg,
        title: Text("Employee Detail"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Card(
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "First Name: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Employee1 "),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "Last Name: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Employee1"),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "Email: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Employee1@gmail.com "),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "Phone No: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("+923015464005 "),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "Designation: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Flutter Developer"),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Check in/Check out Details:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Text(
                                "Date",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                "Check in\n   time",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                "Check out\n   time",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CheckDetails()));
                              },
                              child: Row(
                                children: [
                                  Text("20/11/2020"),
                                  SizedBox(
                                    width: 34,
                                  ),
                                  Text("9:00"),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Text("18:00"),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CheckDetails()));
                              },
                              child: Row(
                                children: [
                                  Text("21/11/2020"),
                                  SizedBox(
                                    width: 34,
                                  ),
                                  Text("9:00"),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Text("18:00"),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CheckDetails()));
                              },
                              child: Row(
                                children: [
                                  Text("22/11/2020"),
                                  SizedBox(
                                    width: 34,
                                  ),
                                  Text("9:00"),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Text("18:00"),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CheckDetails()));
                              },
                              child: Row(
                                children: [
                                  Text("23/11/2020"),
                                  SizedBox(
                                    width: 34,
                                  ),
                                  Text("9:00"),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Text("18:00"),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CheckDetails()));
                              },
                              child: Row(
                                children: [
                                  Text("24/11/2020"),
                                  SizedBox(
                                    width: 34,
                                  ),
                                  Text("9:00"),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Text("18:00"),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(right: 10),
                          //   child: DataTable(columns: [
                          //     DataColumn(
                          //         label: Text('Date',
                          //             style: TextStyle(
                          //                 fontSize: 13,
                          //                 fontWeight: FontWeight.bold))),
                          //     DataColumn(
                          //         label: Expanded(
                          //       child: Text('Check\nin time',
                          //           style: TextStyle(
                          //               fontSize: 13,
                          //               fontWeight: FontWeight.bold)),
                          //     )),
                          //     DataColumn(
                          //         label: Expanded(
                          //       child: Text('Check out\n   time',
                          //           style: TextStyle(
                          //               fontSize: 13,
                          //               fontWeight: FontWeight.bold)),
                          //     )),
                          //   ], rows: [
                          //     DataRow(
                          //       cells: [
                          //         DataCell(
                          //           Text('19/11/2020'),
                          //           onTap: () {
                          //             Navigator.push(
                          //                 context,
                          //                 MaterialPageRoute(
                          //                     builder: (context) =>
                          //                         CheckDetails()));
                          //           },
                          //         ),
                          //         DataCell(Text('9:00')),
                          //         DataCell(Text('18:00')),
                          //       ],
                          //     ),
                          //     DataRow(cells: [
                          //       DataCell(
                          //         Text('20/11/2020'),
                          //         onTap: () {
                          //           Navigator.push(
                          //               context,
                          //               MaterialPageRoute(
                          //                   builder: (context) =>
                          //                       CheckDetails()));
                          //         },
                          //       ),
                          //       DataCell(Text('9:00')),
                          //       DataCell(Text('18:00')),
                          //     ]),
                          //     DataRow(cells: [
                          //       DataCell(Text('21/11/2020')),
                          //       DataCell(Text('9:00')),
                          //       DataCell(Text('18:00')),
                          //     ]),
                          //     DataRow(cells: [
                          //       DataCell(Text('22/11/2020')),
                          //       DataCell(Text('9:00')),
                          //       DataCell(Text('18:00')),
                          //     ]),
                          //   ]),
                          // ),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
