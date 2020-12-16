import 'package:flutter/material.dart';
import 'package:odoo_client/utilis/colors.dart';
import 'package:odoo_client/widget/button.dart';

class CustomerDetail extends StatefulWidget {
  @override
  _CustomerDetailState createState() => _CustomerDetailState();
}

class _CustomerDetailState extends State<CustomerDetail> {
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
      body: SingleChildScrollView(
        child: Column(
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
                    "Customer Details",
                    style: TextStyle(color: main_color),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "Name*",
                      isDense: true,
                      labelStyle: TextStyle(fontSize: 15),
                      contentPadding: EdgeInsets.symmetric(vertical: 4),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "Mobile Number*",
                      isDense: true,
                      labelStyle: TextStyle(fontSize: 15),
                      contentPadding: EdgeInsets.symmetric(vertical: 4),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "Flat no/Building*",
                      isDense: true,
                      labelStyle: TextStyle(fontSize: 15),
                      contentPadding: EdgeInsets.symmetric(vertical: 4),
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
              buttonColor: Colors.blue,
              borderColor: Colors.transparent,
              onPressed: () {}),
        ),
      ),
    );
  }
}
