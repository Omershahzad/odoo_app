import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:odoo_api/odoo_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Admin/DashBoard.dart';
import '../utilis/colors.dart';

class Setting1 extends StatefulWidget {
  Setting1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Setting1State createState() => _Setting1State();
}

class _Setting1State extends State<Setting1> {
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
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AdminHomeScreen()));
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
        appBar: AppBar(
          backgroundColor: cb,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        autocorrect: false,
                        decoration:
                            InputDecoration(hintText: 'Odoo URL http://..'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter odoo URL';
                          }
                          return null;
                        },
                        controller: _urlController,
                      ),
                      TextFormField(
                        autocorrect: false,
                        decoration: InputDecoration(hintText: 'Database'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter Odoo database name';
                          }
                          return null;
                        },
                        controller: _databaseController,
                      ),
                      TextFormField(
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
                      TextFormField(
                        autocorrect: false,
                        obscureText: true,
                        decoration: InputDecoration(hintText: 'Password'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        controller: _passwordController,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        color: cb,
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          if (_formKey.currentState.validate()) {
                            prefs.setString("Odoo_URL", _urlController.text);
                            prefs.setString(
                                "Odoo_Database", _databaseController.text);
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
                      Container(
                        color: (_connected) ? Colors.green : Colors.red,
                        child: Icon(FontAwesomeIcons.plug),
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                      ),
                    ],
                  ),
                ]),
          ),
        ));
  }
}
