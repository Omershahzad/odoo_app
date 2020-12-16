import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odoo_client/utilis/colors.dart';
import 'package:odoo_client/utilis/images.dart';

import 'Dashboard_screen.dart';

class EmployeLogin extends StatefulWidget {
  EmployeLogin({Key key}) : super(key: key);

  @override
  _EmployeLoginState createState() => _EmployeLoginState();
}

class _EmployeLoginState extends State<EmployeLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        // Center(child: Image.asset('assets/login_screen.png')),
        // ClipPath(
        //   clipper: BlueClipper(),
        //   child: Container(
        //     color: cb,
        //   ),
        // ),
        Positioned(
          top: 130,
          left: 220,
          child: Image.asset(
            new_logo,
            height: 50,
          ),
        ),
        ClipPath(
          clipper: GreenClipper(),
          child: Container(
            color: cb,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(45, 130, 0.0, 0.0),
          child: Text("Employee".toUpperCase(),
              style: GoogleFonts.montserrat(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: EdgeInsets.only(top: 280, right: 15, left: 15),
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person,
                color: cb,
              ),
              border: OutlineInputBorder(
                gapPadding: 0.0,
                // width: 0.0 produces a thin "hairline" border
                borderRadius: BorderRadius.all(Radius.circular(120.0)),
                borderSide: BorderSide.none,
                //borderSide: const BorderSide(),
              ),
              hintStyle: TextStyle(color: cb, fontFamily: "WorkSansLight"),
              filled: true,
              fillColor: Color(0xfff2f2f2),
              hintText: 'Username',
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(top: 360, right: 15, left: 15),
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.remove_red_eye,
                color: cb,
              ),
              border: OutlineInputBorder(
                gapPadding: 0.0,
                // width: 0.0 produces a thin "hairline" border
                borderRadius: BorderRadius.all(Radius.circular(120.0)),
                borderSide: BorderSide.none,
                //borderSide: const BorderSide(),
              ),
              hintStyle: TextStyle(color: cb, fontFamily: "WorkSansLight"),
              filled: true,
              fillColor: Color(0xfff2f2f2),
              hintText: 'Password',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 480, 25.0, 0.0),
          child: Row(
            children: [
              Text("Sign in".toUpperCase(),
                  style: GoogleFonts.montserrat(
                      fontSize: 22,
                      color: Color(0xff434343),
                      fontWeight: FontWeight.bold)),
              Spacer(),
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                elevation: 2.0,
                fillColor: cb,
                child: Icon(Icons.arrow_forward, color: Colors.white),
                padding: EdgeInsets.all(18.0),
                shape: CircleBorder(),
              )
            ],
          ),
        )
      ],
    ));
  }
}

class GreenClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    path.lineTo(0, size.height / 6.25);
    var firstControlPoint = new Offset(size.width / 4, size.height / 2);
    var firstEndPoint = new Offset(size.width / 2, size.height / 3 - 30);
    var secondControlPoint =
        new Offset(size.width - (size.width / 4), size.height / 5 - 60);
    var secondEndPoint = new Offset(size.width, size.height / 4 - 30);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height / 3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}

class BlueClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip

    var path = new Path();
    path.lineTo(0, size.height / 3);
    var firstControlPoint = new Offset(size.width / 6, size.height / 3);
    var firstEndPoint = new Offset(size.width / 2.85, size.height / 4);
    var secondControlPoint = new Offset(size.width / 2 + 40, size.height / 6);
    var secondEndPoint =
        new Offset(size.width - (size.width / 4), size.height / 3.5);
    var thirdControlPoint = new Offset(size.width - 20, size.height / 6);
    var thirdEndPoint = new Offset(size.width, size.height / 4);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(size.width, size.height / 4);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(oldClipper) => false;
}
