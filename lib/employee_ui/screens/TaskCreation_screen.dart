import 'package:flutter/material.dart';
import 'package:odoo_client/utilis/colors.dart';
import 'package:odoo_client/widget/button.dart';

import 'CutomerDetail_screen.dart';
import 'SelectDate_screen.dart';
import 'SelectEmployee_screen.dart';

class TaskCreation extends StatefulWidget {
  @override
  _TaskCreationState createState() => _TaskCreationState();
}

class _TaskCreationState extends State<TaskCreation> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cb,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Task Creation"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "Job Id",
                      isDense: true,
                      labelStyle: TextStyle(fontSize: 15),
                      contentPadding: EdgeInsets.symmetric(vertical: 4),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: "Task Description",
                      isDense: true,
                      labelStyle: TextStyle(fontSize: 15),
                      contentPadding: EdgeInsets.symmetric(vertical: 4),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              width: width,
              height: height * 0.30,
              color: Color(0xffeff1f2),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomerDetail()));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.wrap_text,
                            color: cb,
                            size: 28,
                          ),
                          SizedBox(
                            width: height * 0.02,
                          ),
                          Text(
                            "Customer Details",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          Spacer(),
                          Text(
                            "Task location",
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectEmployee()));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_outlined,
                            color: cb,
                            size: 28,
                          ),
                          SizedBox(
                            width: height * 0.02,
                          ),
                          Text(
                            "Assign",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          Spacer(),
                          Text(
                            "Assign to your employee",
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectDate()));
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: cb,
                            size: 28,
                          ),
                          SizedBox(
                            width: height * 0.02,
                          ),
                          Text(
                            "Schedule",
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                          Spacer(),
                          Text(
                            "Schedule date and time",
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Container(
          width: width,
          child: SignButton(
              screen: screen,
              width: screen ? width * 0.8 : height * 0.1,
              height: screen ? width * 0.14 : height * 0.1,
              txt: "Done",
              txtColor: Colors.white,
              buttonColor: cb,
              borderColor: Colors.transparent,
              onPressed: () {}),
        ),
      ),
    );
  }
}
