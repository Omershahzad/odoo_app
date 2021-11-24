import 'package:flutter/material.dart';
import 'package:odoo_client/app/data/Models/partners.dart';
import 'package:odoo_client/app/data/services/odoo_response.dart';
import 'package:odoo_client/app/pages/partner_details.dart';
import 'package:odoo_client/app/pages/profile.dart';
import 'package:odoo_client/app/pages/settings.dart';
import 'package:odoo_client/app/utility/strings.dart';
import 'package:odoo_client/utilis/colors.dart';
import 'package:odoo_client/base.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends Base<Home> {
  //Odoo _odoo;
  List<Partner> _partners = [];

  _getPartners() async {
    isConnected().then((isInternet) {
      if (isInternet) {
        // showLoading();
        odoo.searchRead(
            Strings.res_employee, [], ['work_email', 'name', 'job_title']).then(
          (OdooResponse res) {
            if (!res.hasError()) {
              setState(() {
                hideLoading();
                String session = getSession();
                session = session.split(",")[0].split(";")[0];
                for (var i in res.getRecords()) {
                  _partners.add(
                    new Partner(
                      id: i["id"],
                      work_email:
                          i["work_email"] is! bool ? i["work_email"] : "N/A",
                      name: i["name"],
                      job_title:
                          i["job_title"] is! bool ? i["job_title"] : "N/A",
                      imageUrl: getURL() +
                          "/web/image?model=hr.employee&field=image_1920&" +
                          session +
                          "&id=" +
                          i["id"].toString(),
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
    _getPartners();
    getOdooInstance().then((odoo) {
      _getPartners();
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
                Strings.no_orders,
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
        backgroundColor: c3,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Employee",
          style: TextStyle(color: Colors.white),
        ),
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
      body: _partners.length > 0
          ? ListView.builder(
              clipBehavior: Clip.hardEdge,
              itemCount: _partners.length,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, i) => InkWell(
                onTap: () {
                  push(PartnerDetails(data: _partners[i]));
                },
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 55, right: 55),
                      child: Divider(
                        height: 10.0,
                      ),
                    ),
                    Container(
                      width: 320,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.indigo[100],
                      ),
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: CircleAvatar(
                            foregroundColor: Theme.of(context).primaryColor,
                            backgroundColor: Colors.grey,
                            backgroundImage:
                                NetworkImage(_partners[i].imageUrl),
                            radius: 30.0,
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              _partners[i].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: cg),
                            ),
                          ],
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                _partners[i].job_title,
                                style: TextStyle(color: cg, fontSize: 15.0),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                _partners[i].work_email,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 15.0),
                              ),
                            ),
                          ],
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
