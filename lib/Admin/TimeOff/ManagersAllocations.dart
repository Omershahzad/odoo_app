import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:odoo_api/odoo_api.dart';
import 'package:odoo_client/app/data/Models/mytimeoffallocation_model.dart';
import 'package:odoo_client/app/data/services/odoo_response.dart';
import 'package:odoo_client/app/pages/profile.dart';
import 'package:odoo_client/app/pages/settings.dart';
import 'package:odoo_client/base.dart';
import 'package:odoo_client/utilis/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManagerAllocations extends StatefulWidget {
  @override
  _ManagerAllocationsState createState() => _ManagerAllocationsState();
}

class _ManagerAllocationsState extends Base<ManagerAllocations> {
  List<MyTimeAllocation> _mytimeAllocation = [];
  var _client;

  _gettimeallocation() {
    isConnected().then((isInternet) async {
      if (isInternet) {
        showLoading();
        final prefs = await SharedPreferences.getInstance(); //ye
        _client = new OdooClient((prefs.getString("Odoo_URL") ?? "")); //ye
        _client
            .authenticate(
                prefs.getString("User_Name"), //ye
                prefs.getString("Password"),
                prefs.getString("Odoo_Database")) //ye
            .then((auth) {
          _client.searchRead("hr.leave.allocation", [
            //odoo.searchread tha change kiya
            // ["employee_id.name", "!=", "Administrator"]
            ["user_id", "=", auth.getUser().uid]
          ], [
            'employee_id',
            'holiday_status_id',
            'name',
            'duration_display',
            'state'
          ]).then(
            (OdooResponse res) {
              print(res);
              if (!res.hasError()) {
                setState(() {
                  hideLoading();
                  String session = getSession();
                  session = session.split(",")[0].split(";")[0];
                  for (var i in res.getRecords()) {
                    _mytimeAllocation.add(
                      new MyTimeAllocation(
                          id: i["id"],
                          employee_id: i["employee_id"] ?? "",
                          holiday_status_id: i["holiday_status_id"],
                          name: i["name"],
                          duration: i["duration_display"],
                          state: i["state"]),
                    );
                  }
                });
                print(res);
              } else {
                print(res.getError());
                showMessage("Warning", res.getErrorMessage());
              }
            },
          );
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // _getPay();
    //_pay.clear();
    getOdooInstance().then((odoo) {
      _gettimeallocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    final emptyView = Container(
      alignment: Alignment.center,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.person_outline,
              color: Colors.grey.shade300,
              size: 100,
            ),
            Padding(
              padding: EdgeInsets.all(1.0),
              child: Text(
                "No Sheet to Display",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Color(0xff875a7b),
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Managers Allocation",
          style: TextStyle(color: Color(0xff875a7b)),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Color(0xff875a7b),
            ),
            onPressed: () {
              push(Settings());
            },
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: Color(0xff875a7b),
            ),
            onPressed: () {
              push(ProfilePage());
            },
          ),
        ],
      ),
      body: _mytimeAllocation.length > 0
          ? ListView.builder(
              itemCount: _mytimeAllocation.length,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, i) => InkWell(
                onTap: () {
                  //      push(PartnerDetails(data: _pay[i]));
                },
                child: Column(
                  children: <Widget>[
                    Divider(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200]),
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Employee : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      _mytimeAllocation[i].employee_id[1],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Time Off Type : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      _mytimeAllocation[i].holiday_status_id[1],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Description : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      _mytimeAllocation[i].name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Duration : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      _mytimeAllocation[i].duration,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Status : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      _mytimeAllocation[i].state,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        subtitle: Container(
                          padding: const EdgeInsets.only(top: 5.0),
                          // child: Text(
                          //   _pay[i].description[0],
                          //   style: TextStyle(color: Colors.grey, fontSize: 15.0),
                          // ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          : emptyView,
    );
  }
}
