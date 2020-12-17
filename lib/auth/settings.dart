import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:odoo_api/odoo_api.dart';
import 'package:odoo_client/Admin/DashBoard.dart';
import 'package:odoo_client/utilis/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../employee_ui/screens/Dashboard_screen.dart';
import '../utilis/colors.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  bool _connected = false;
  var _client;
  final _formKey = GlobalKey<FormState>();
  final _urlController = TextEditingController();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _databaseController = TextEditingController();

  void _checkConnectionState() async {
    final prefs = await SharedPreferences.getInstance();
    _client = new OdooClient((prefs.getString("Odoo_URL") ?? ""));
    _client.connect().then((version) {
      setState(() {
        _connected = true;
      });
      if (prefs.getString('User_Name') == "admin") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AdminHomeScreen()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });
  }

  @protected
  @mustCallSuper
  void initState() {
    // This method will be called every time the screen is started
    // It checks the connection with the odoo server
    _checkConnectionState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 30),
            ),
          ),
          Container(
            child: Image.asset(
              x_logo,
              height: 100,
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      elevation: 10.0,
                      shadowColor: c1,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: TextFormField(
                                autocorrect: false,
                                decoration: InputDecoration(
                                    hintText: 'Odoo URL http://..'),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter odoo URL';
                                  }
                                  return null;
                                },
                                controller: _urlController,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                              child: TextFormField(
                                autocorrect: false,
                                decoration:
                                    InputDecoration(hintText: 'Database'),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter Odoo database name';
                                  }
                                  return null;
                                },
                                controller: _databaseController,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                              child: TextFormField(
                                autocorrect: false,
                                decoration: InputDecoration(hintText: 'Login'),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your login';
                                  }
                                  return null;
                                },
                                controller: _userNameController,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                              child: TextFormField(
                                autocorrect: false,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                                controller: _passwordController,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: RaisedButton(
                                color: cg,
                                onPressed: () async {
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  if (_formKey.currentState.validate()) {
                                    prefs.setString(
                                        "Odoo_URL", _urlController.text);
                                    prefs.setString("Odoo_Database",
                                        _databaseController.text);
                                    prefs.setString(
                                        "User_Name", _userNameController.text);
                                    prefs.setString(
                                        "Password", _passwordController.text);
                                    _checkConnectionState();
                                  }
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Container(
                            child: Icon(FontAwesomeIcons.plug),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (_connected) ? Colors.green : Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ],
      ),
    ));
  }
}
