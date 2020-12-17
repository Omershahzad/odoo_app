import 'package:flutter/material.dart';
import 'package:odoo_client/app/data/Models/mytimeoffallocation_model.dart';
import 'package:odoo_client/app/pages/profile.dart';
import 'package:odoo_client/app/pages/settings.dart';
import 'package:odoo_client/utilis/colors.dart';
import '../../base.dart';
import 'package:odoo_client/app/data/services/odoo_response.dart';

class TimeAllocation extends StatefulWidget {
  @override
  _TimeAllocationState createState() => _TimeAllocationState();
}

class _TimeAllocationState extends Base<TimeAllocation> {
  List<MyTimeAllocation> _mytimeAllocation = [];

  _gettimeallocation() async {
    isConnected().then((isInternet) {
      if (isInternet) {
        showLoading();
        odoo.searchRead("hr.leave.allocation", [
          ["employee_id.name", "=", "Administrator"]
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
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Color(0xff875a7b),
          ),
        ),
        title: Text(
          "My Allocation Requests",
          style: TextStyle(
            color: cg,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: cg,
            ),
            onPressed: () {
              push(Settings());
            },
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: cg,
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
                            // Text(
                            //   _pay[i].type,
                            //   style: TextStyle(fontWeight: FontWeight.bold),
                            // ),

                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Time Off Type : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    _mytimeAllocation[i].holiday_status_id[1],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      "Description : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
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
                                  Text(
                                    "Duration : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    _mytimeAllocation[i].duration,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Text(
                                    "Status : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    _mytimeAllocation[i].state,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
