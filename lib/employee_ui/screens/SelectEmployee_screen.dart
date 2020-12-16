import 'package:flutter/material.dart';
import 'package:odoo_client/utilis/colors.dart';
import 'package:odoo_client/utilis/images.dart';

class SelectEmployee extends StatefulWidget {
  @override
  _SelectEmployeeState createState() => _SelectEmployeeState();
}

class _SelectEmployeeState extends State<SelectEmployee> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Task Creation"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 20),
                child: Text(
                  "Select employee",
                  style: TextStyle(color: main_color),
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Employee",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                prefixIcon: Icon(
                  Icons.search,
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.06,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
                      "User1",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    Text(
                      "user1@gmail.com",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "Unavailable",
                  style: TextStyle(color: Colors.red, fontSize: 10),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
                      "User2",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    Text(
                      "user2@gmail.com",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "Available",
                  style: TextStyle(color: Colors.green, fontSize: 10),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
