import 'package:flutter/material.dart';
import 'package:odoo_client/app/data/Models/payroll_Model.dart';
import 'package:odoo_client/app/data/services/odoo_response.dart';
import 'package:odoo_client/app/pages/partner_details.dart';
import 'package:odoo_client/app/pages/profile.dart';
import 'package:odoo_client/app/pages/settings.dart';
import 'package:odoo_client/app/utility/strings.dart';
import 'package:odoo_client/base.dart';
import 'package:odoo_client/utilis/colors.dart';

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
        odoo.searchRead("hr.payslip", [], [
          'employee_id',
          'date_from',
          'date_to',
          'company_id',
          'basic_wage',
          'net_wage',
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
                  _pay.add(
                    new Pay(
                        id: i["id"],
                        // type: i["worked_entry_type_id"] is! bool
                        //     ? i["worked_entry_type_id"]
                        //     : "N/A",
                        description: i["employee_id"],
                        nodays:
                            i["date_from"] is! bool ? i["date_from"] : "N/A",
                        nohours: i["date_to"],
                        company: i["company_id"],
                        basic_wage: i["basic_wage"],
                        net_wage: i["net_wage"],
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
          "Payslip",
          style: TextStyle(color: cg),
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
                    Container(
                      width: 320,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.purple[100]),
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            // Text(
                            //   _pay[i].type,
                            //   style: TextStyle(fontWeight: FontWeight.bold),
                            // ),

                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Employee : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    _pay[i].description[1],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, color: cg),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "From : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    _pay[i].nodays.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, color: cg),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "To : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    _pay[i].nohours.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, color: cg),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Company : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    _pay[i].company[1],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, color: cg),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Basic : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    _pay[i].basic_wage.toString() + " €",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, color: cg),
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Net : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    _pay[i].net_wage.toString() + " €",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, color: cg),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "State : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    _pay[i].state,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, color: cg),
                                  ),
                                ),
                              ],
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
