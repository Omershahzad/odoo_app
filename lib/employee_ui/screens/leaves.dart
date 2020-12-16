import 'package:flutter/material.dart';
import 'package:odoo_client/utilis/images.dart';

class Leaves extends StatefulWidget {
  @override
  _LeavesState createState() => _LeavesState();
}

class _LeavesState extends State<Leaves> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(110),
          child: AppBar(
            title: Text("Leaves"),
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.white,
              labelStyle: TextStyle(
                fontSize: 15,
              ),
              tabs: [
                Tab(
                  text: "My Leaves",
                ),
                Tab(
                  text: "Approvals",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            //---------------------------- My Leaves Tab ----------------------------

            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(avatar),
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sick Leave",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                              Text(
                                "11/12/2020 to 13/12/2020",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            "pending",
                            style: TextStyle(color: Colors.amber, fontSize: 10),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(avatar),
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Casual Leave",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                              Text(
                                "11/12/2020 to 13/12/2020",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            "approved",
                            style: TextStyle(color: Colors.green, fontSize: 10),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(avatar),
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Others",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                              Text(
                                "11/12/2020 to 13/12/2020",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            "Not approved",
                            style: TextStyle(color: Colors.red, fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //-------------------------------Approvals Tab-------------------------
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(avatar),
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "admin",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                              Text(
                                "11/12/2020 to 13/12/2020",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            "pending",
                            style: TextStyle(color: Colors.amber, fontSize: 10),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(avatar),
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "admin",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                              Text(
                                "11/12/2020 to 13/12/2020",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text(
                            "pending",
                            style: TextStyle(color: Colors.amber, fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: FloatingActionButton(
                heroTag: Text("btn1"),
                backgroundColor: Colors.amber,
                onPressed: () {},
                child: Icon(
                  Icons.filter_tilt_shift,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: FloatingActionButton(
                heroTag: Text("btn2"),
                onPressed: () {},
                child: Icon(Icons.add),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            )
          ],
        ),
      ),
    );
  }
}
