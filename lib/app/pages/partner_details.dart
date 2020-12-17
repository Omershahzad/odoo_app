import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odoo_client/app/data/Models/partners.dart';

import '../../base.dart';

import '../data/services/odoo_response.dart';
import '../utility/strings.dart';

class PartnerDetails extends StatefulWidget {
  PartnerDetails({this.data});

  final data;

  @override
  _PartnerDetailsState createState() => _PartnerDetailsState();
}

class _PartnerDetailsState extends Base<PartnerDetails> {
  var refreshkey = GlobalKey<RefreshIndicatorState>();
  String name = "";
  String job = "";
  String image_URL = "";
  String email = "";
  String department = "";
  var phone = "";
  var company = "";
  var jobposition = "";
  var country = "";
  Partner _partner;

  @override
  void initState() {
    super.initState();

    _partner = widget.data;

    _getProfileData();
    getOdooInstance().then((odoo) {
      _getProfileData();
    });
  }

  _getProfileData() async {
    isConnected().then((isInternet) {
      if (isInternet) {
        odoo.searchRead(Strings.res_employee, [
          ["id", "=", _partner.id]
        ], []).then(
          (OdooResponse res) {
            if (!res.hasError()) {
              setState(() {
                String session = getSession();
                session = session.split(",")[0].split(";")[0];
                final result = res.getResult()['records'][0];
                name = result["name"];
                job = result["job_title"];
                email = result["work_email"];
                department = result["department_id"];
                phone = result['work_phone'] is! bool
                    ? result['work_phone']
                    : "N/A";
                print("----------phone-------------$phone");
                company = result['company_id'] is! bool
                    ? result['company_id']
                    : "N/A";

                image_URL = getURL() +
                    "/web/image?model=hr.employee&field=image_1920&" +
                    session +
                    "&id=" +
                    _partner.id.toString();
              });
            }
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final upper_header = Container(
      color: Color(0xff875a7b),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50),
          ),
          new Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(70.0),
            ),
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  _partner.imageUrl != null
                      ? _partner.imageUrl
                      : "https://image.flaticon.com/icons/png/512/1144/1144760.png",
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 5.0, bottom: 5.0)),
          Text(
            _partner.name,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 2.0, bottom: 2.0)),
          Text(
            _partner.work_email,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 8.0, bottom: 35.0)),
        ],
      ),
    );

    final lower = Container(
      child: ListView(
        children: <Widget>[
          Container(
            height: 75,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.grey.shade100,
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(right: 10.0)),
                  // Image(
                  //   image: AssetImage("assets/worker.png"),
                  //   height: 30.0,
                  //   width: 30.0,
                  //   color: Colors.black,
                  // ),
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Text(
                    "Id:",
                    style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Montserrat",
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    _partner.id.toString() != null
                        ? _partner.id.toString()
                        : "",
                    style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 75,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.grey.shade100,
                child: Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(right: 10.0)),
                    Padding(padding: EdgeInsets.only(left: 10.0)),
                    Text(
                      "Job Title:",
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Montserrat",
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      _partner.job_title != null ? _partner.job_title : "",
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            child: Container(
              height: 75,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.grey.shade100,
                child: Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(right: 10.0)),
                    Image(
                      image: AssetImage("assets/web.png"),
                      height: 30.0,
                      width: 30.0,
                    ),
                    Padding(padding: EdgeInsets.only(left: 10.0)),
                    // Text(
                    //   job != null ? job : "",
                    //   style: TextStyle(
                    //     fontSize: 19.0,
                    //     fontWeight: FontWeight.bold,
                    //     fontFamily: "Montserrat",
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            child: Container(
              height: 75,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.grey.shade100,
                child: Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(right: 10.0)),
                    Image(
                      image: AssetImage("assets/mobile.png"),
                      height: 30.0,
                      width: 30.0,
                    ),
                    Padding(padding: EdgeInsets.only(left: 10.0)),
                    Text(
                      company != null ? company : "",
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            child: Container(
              height: 75,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.grey.shade100,
                child: Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(right: 10.0)),
                    Image(
                      image: AssetImage("assets/call.png"),
                      height: 30.0,
                      width: 30.0,
                    ),
                    Padding(padding: EdgeInsets.only(left: 10.0)),
                    Text(
                      phone != null ? phone : "",
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      key: scaffoldKey,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 260.0,
              floating: false,
              pinned: false,
              backgroundColor: Color(0xff875a7b),
              flexibleSpace: FlexibleSpaceBar(
                background: upper_header,
              ),
            ),
          ];
        },
        body: lower,
      ),
    );
  }
}
