import 'package:flutter/material.dart';
import 'package:odoo_client/Admin/DashBoard.dart';
import 'package:odoo_client/utilis/colors.dart';
import 'package:odoo_client/utilis/images.dart';
import 'package:odoo_client/widget/button.dart';

class AdminLogin extends StatefulWidget {
  AdminLogin({Key key}) : super(key: key);

  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  String _email;

  String _password;
  String err = "";

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width * .04),
            width: width,
            height: height,
            child: Center(
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      height: height * .10,
                    ),
                    Image.asset(
                      logo,
                      height: 100,
                    ),
                    SizedBox(
                      height: height * .11,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            // width: 0.0 produces a thin "hairline" border
                            borderRadius:
                                BorderRadius.all(Radius.circular(90.0)),
                            borderSide: BorderSide.none,
                            //borderSide: const BorderSide(),
                          ),
                          hintStyle: TextStyle(
                              color: Colors.white, fontFamily: "WorkSansLight"),
                          filled: true,
                          fillColor: Colors.white24,
                          hintText: 'Password'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: TextFormField(
                        validator: (input) {
                          if (input.length < 6) {
                            return "Your password should be more than 6 characters";
                          }
                        },
                        onSaved: (input) => _password = input,
                        decoration: new InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: admin_color),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: admin_color, width: 1.0),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: Text(
                          err,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Align(
                          alignment: Alignment.topRight,
                          child: Text("Forget Password?".toUpperCase(),
                              style: TextStyle(
                                  color: admin_color,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 10.0, right: 10.0, top: height * .06),
                      child: SignButton(
                          screen: screen,
                          width: screen ? width * 0.8 : height * 0.1,
                          height: screen ? width * 0.14 : height * 0.1,
                          txt: "LOGIN",
                          txtColor: Colors.white,
                          buttonColor: Colors.green,
                          borderColor: Colors.green,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminHomeScreen()));
                            // Signin(context);
                          }),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> Signin(context) async {
  //   final _formstate = _formkey.currentState;
  //   err = "";
  //   _formstate.save();
  //   if (_formstate.validate()) {
  //     try {
  //       UserCredential user = await FirebaseAuth.instance
  //           .signInWithEmailAndPassword(email: _email, password: _password);
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => HomeScreen()));
  //     } catch (e) {
  //       err = e.message;
  //       print(e.message);
  //     }
  //   }
  // }
}
