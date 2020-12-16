import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:odoo_api/odoo_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'settings.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _employeeIn = false;
  var _client;
  // String name = "";

  void _checkEmployeeState() async {
    // It checks the employee state
    final prefs = await SharedPreferences.getInstance();
    _client = new OdooClient((prefs.getString("Odoo_URL") ?? ""));
    _client
        .authenticate(prefs.getString("User_Name"), prefs.getString("Password"),
            prefs.getString("Odoo_Database"))
        .then((auth) {
      if (auth.isSuccess) {
        // The hr_employee Object is the one who register the attendance
        _client.searchRead("hr.employee", [
          ["user_id", "=", auth.getUser().uid],
          // ["name", "=", auth.getUser().name]
        ], [
          "id",
          "attendance_state",
          // "name"
        ]).then((employeeResult) {
          if (!employeeResult.hasError()) {
            var employeeState =
                employeeResult.getResult()["records"][0]["attendance_state"];
            // name = employeeState.getResult()["records"][0]["name"];
            if (employeeState == "checked_in") {
              setState(() {
                _employeeIn = true;
              });
            } else {
              setState(() {
                _employeeIn = false;
              });
            }
          }
        });
      }
    }).catchError((e) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SettingsPage(title: "Settings")));
    });
  }

  void _sign() async {
    final prefs = await SharedPreferences.getInstance();
    _client = new OdooClient((prefs.getString("Odoo_URL") ?? ""));

    _client
        .authenticate(prefs.getString("User_Name"), prefs.getString("Password"),
            prefs.getString("Odoo_Database"))
        .then((auth) {
      if (auth.isSuccess) {
        // The hr_employee Object is the one who register the attendance
        _client.searchRead("hr.employee", [
          ["user_id", "=", auth.getUser().uid],
          // ["name", "=", auth.getUser().name]
        ], [
          "id",
        ]).then((employeeResult) {
          if (!employeeResult.hasError()) {
            var _employee = employeeResult.getResult()["records"][0]["id"];
            // name = employeeResult.getResult()["records"][0]["name"];
            // Call the attendance_manual method that will do the rest in server side
            _client.callKW("hr.employee", "attendance_manual", [
              _employee,
              "hr_attendance.hr_attendance_action_my_attendances"
            ]).then((kwResult) {
              if (!kwResult.hasError()) {
                setState(() {
                  // _employeeIn = !_employeeIn;
                });
              }
            });
          }
        });
      }
    });
  }

  @protected
  @mustCallSuper
  void initState() {
    // This method will be called every time the screen is started
    // It checks the Employee state at start
    _checkEmployeeState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(""), actions: <Widget>[
        IconButton(
          icon: Icon(FontAwesomeIcons.sync),
          onPressed: _checkEmployeeState,
        ),
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text((_employeeIn) ? 'Click to Check out' : 'Click to Check in'),
            Center(
                child: Container(
              color: Theme.of(context).accentColor,
              child: IconButton(
                  icon: (_employeeIn)
                      ? Icon(FontAwesomeIcons.signOutAlt,
                          color: Colors.red, size: 100)
                      : Icon(FontAwesomeIcons.signInAlt,
                          color: Colors.white, size: 100),
                  onPressed: () {
                    _sign();
                    setState(() {
                      _employeeIn = !_employeeIn;
                    });
                  }),
              width: 200,
              height: 200,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.clear();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SettingsPage(title: "Login")));
        },
        tooltip: 'logout',
        child: Icon(Icons.logout),
      ),
    );
  }
}
