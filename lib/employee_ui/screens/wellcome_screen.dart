import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odoo_client/auth/setting1.dart';
import 'package:odoo_client/auth/settings.dart';
import 'package:odoo_client/employee_ui/screens/curve.dart';
import 'package:odoo_client/employee_ui/screens/curve2.dart';
import 'package:odoo_client/utilis/colors.dart';
import 'package:odoo_client/utilis/images.dart';
import 'package:odoo_client/widget/button.dart';

import 'Login.dart';

class Wellcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(children: [
              // Container(
              //   width: width,
              //   height: height,
              //   child: Image.asset(
              //     new_bg,
              //   ),
              // ),
              Container(
                width: width,
                child: Column(
                  children: [
                    Container(
                      height: 400,
                      width: width,
                      decoration: BoxDecoration(
                        color: cg,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(150.0),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 40,
                            top: 50,
                            child: Container(
                              child: Image.asset(
                                x_logo,
                                height: 100,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 70,
                            left: 110,
                            child: Text("Welcome to \n   Dynexcel",
                                style: GoogleFonts.raleway(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                          Positioned(
                            top: 170,
                            left: 20,
                            child: Text(
                                "We offer flexible and cost-effective group memberships for \nyour business, school, or government organization.",
                                style: GoogleFonts.raleway(
                                    fontSize: 10, color: Colors.white)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.09,
                    ),
                    SignButton(
                        screen: screen,
                        width: screen ? width * 0.8 : height * 0.1,
                        height: screen ? width * 0.14 : height * 0.1,
                        txt: "LOGIN AS employee".toUpperCase(),
                        txtColor: Colors.white,
                        buttonColor: cb,
                        borderColor: cb,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SettingsPage(title: 'Employee')));
                        }),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    // SignButton(
                    //     screen: screen,
                    //     width: screen ? width * 0.8 : height * 0.1,
                    //     height: screen ? width * 0.14 : height * 0.1,
                    //     txt: "LOGIN as admin".toUpperCase(),
                    //     txtColor: Colors.white,
                    //     buttonColor: cg,
                    //     borderColor: cg,
                    //     onPressed: () {
                    //       Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) =>
                    //                   Setting1(title: 'Admin')));
                    //     }),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
