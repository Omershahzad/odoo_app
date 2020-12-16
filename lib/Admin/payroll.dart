import 'package:flutter/material.dart';
import 'package:odoo_client/app/data/pojo/partners.dart';
import 'package:odoo_client/app/data/pojo/payroll_Model.dart';
import 'package:odoo_client/app/data/services/odoo_response.dart';
import 'package:odoo_client/app/pages/partner_details.dart';
import 'package:odoo_client/app/pages/profile.dart';
import 'package:odoo_client/app/pages/settings.dart';
import 'package:odoo_client/app/utility/strings.dart';
import 'package:odoo_client/base.dart';

class PayRoll extends StatefulWidget {
  @override
  _PayRollState createState() => _PayRollState();
}

class _PayRollState extends Base<PayRoll> {
  List<Pay> _pay = [];

  _getPay() async {
    isConnected().then((isInternet) {
      if (isInternet) {
        showLoading();
        odoo.searchRead("hr.payslip", [],
            ['employee_id', 'date_from', 'date_to', 'company_id']).then(
          (OdooResponse res) {
            print(res);
            if (!res.hasError()) {
              setState(() {
                hideLoading();
                String session = getSession();
                session = session.split(",")[0].split(";")[0];
                for (var i in res.getRecords()) {
                  _pay.add(
                    new Pay(
                      id: i["id"],
                      // type: i["worked_entry_type_id"] is! bool
                      //     ? i["worked_entry_type_id"]
                      //     : "N/A",
                      description: i["employee_id"],
                      nodays: i["date_from"] is! bool ? i["date_from"] : "N/A",
                      nohours: i["date_to"],
                      amount: i["company_id"],
                    ),
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
    _getPay();
    getOdooInstance().then((odoo) {
      _getPay();
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
        backgroundColor: Color(0xff875a7b),
        title: Text("Payslip"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              push(Settings());
            },
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              push(ProfilePage());
            },
          ),
        ],
      ),
      body: _pay.length > 0
          ? ListView.builder(
              itemCount: _pay.length,
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
                    ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          // Text(
                          //   _pay[i].type,
                          //   style: TextStyle(fontWeight: FontWeight.bold),
                          // ),
                          Text(
                            _pay[i].nodays.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _pay[i].nohours.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _pay[i].amount,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      subtitle: Container(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          _pay[i].description,
                          style: TextStyle(color: Colors.grey, fontSize: 15.0),
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
