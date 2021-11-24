import 'package:flutter/material.dart';
import 'package:odoo_client/app/data/services/odoo_response.dart';
import 'package:odoo_client/app/pages/partner_details.dart';
import 'package:odoo_client/app/pages/profile.dart';
import 'package:odoo_client/app/pages/settings.dart';
import 'package:odoo_client/app/utility/strings.dart';
import 'package:odoo_client/base.dart';
import 'package:odoo_client/utilis/colors.dart';

import 'models/message_model.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends Base<ChatScreen> {
  //Odoo _odoo;
  List<Message> _partners = [];

  _getPartners() async {
    isConnected().then((isInternet) {
      if (isInternet) {
        showLoading();
        odoo.searchRead('mail.message', [],
            ['message_id', 'author_id', 'display_name']).then(
              (OdooResponse res) {
            print(res);
            if (!res.hasError()) {
              setState(() {
                hideLoading();
                String session = getSession();
                session = session.split(",")[0].split(";")[0];
                for (var i in res.getRecords()) {
                  _partners.add(
                    new Message(
                        messageId: i["message_id"],
                        authorId:
                        i["author_id"] is! bool ? i["author_id"] : "N/A",
                        displayName: i["display_name"]),
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
    // _getPartners();
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
                "no conversation",
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
          "Chats",
          style: TextStyle(color: Color(0xff875a7b)),
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
      body: _partners.length > 0
          ? ListView.builder(
        clipBehavior: Clip.hardEdge,
        itemCount: _partners.length,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, i) => InkWell(
          onTap: () {
            push(PartnerDetails(data: _partners[i].authorId));
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
                      radius: 30.0,
                    ),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _partners[i].displayName,
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
                          _partners[i].channelId.toString(),
                          style: TextStyle(color: cg, fontSize: 15.0),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          _partners[i].messageId.toString(),
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
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.all(6.0),
      //   child: FloatingActionButton(
      //     backgroundColor: Colors.white,
      //     foregroundColor: cg,
      //     splashColor: cg,
      //     elevation: 20.0,
      //     onPressed: () {
      //       Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => AddEmployee()));
      //     },
      //     child: Icon(Icons.add),
      //   ),
      // ),
    );
  }
}
