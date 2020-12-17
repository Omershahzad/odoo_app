import 'package:flutter/material.dart';
import 'package:odoo_client/utilis/colors.dart';
import 'package:odoo_client/utilis/images.dart';

class ChatUI extends StatefulWidget {
  ChatUI({Key key}) : super(key: key);

  @override
  _ChatUIState createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: 280,
            width: width,
            color: cg,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Chats",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Card(
                          elevation: 4,
                          child: Container(
                            height: 90,
                            width: 95,
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: cg,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    )),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("New Chat",
                                    style: TextStyle(
                                      color: cg,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.01,
                        ),
                        Card(
                          elevation: 4,
                          child: Container(
                            height: 90,
                            width: 95,
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: cg,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Icon(
                                      Icons.group,
                                      color: Colors.white,
                                    )),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("Groups",
                                    style: TextStyle(
                                      color: cg,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.01,
                        ),
                        Card(
                          elevation: 4,
                          child: Container(
                            height: 90,
                            width: 95,
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        color: cg,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    )),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("Account",
                                    style: TextStyle(
                                      color: cg,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 240),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(pic),
                        maxRadius: 25,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("User 1",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Hi! How are you?",
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "12:44 AM",
                            style: TextStyle(color: Colors.black),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: cg,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                "2",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
                  ),
                  Divider(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(children: [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundImage: AssetImage(pic),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("User 2",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Hope you are fine",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        "2 hrs ago",
                        style: TextStyle(color: Colors.grey),
                      )
                    ]),
                  ),
                  Divider(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(children: [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundImage: AssetImage(
                          profile,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("User 3",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Message here",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        " 2 days ago",
                        style: TextStyle(color: Colors.grey),
                      )
                    ]),
                  ),
                  Divider(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(children: [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundImage: AssetImage(
                          profile,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("User 4",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Message here",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        "1 month ago",
                        style: TextStyle(color: Colors.grey),
                      )
                    ]),
                  ),
                  Divider(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(children: [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundImage: AssetImage(
                          profile,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("User 4",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Message here",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        "1 month ago",
                        style: TextStyle(color: Colors.grey),
                      )
                    ]),
                  ),
                  Divider(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(children: [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundImage: AssetImage(
                          profile,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("User 4",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Message here",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        "1 month ago",
                        style: TextStyle(color: Colors.grey),
                      )
                    ]),
                  ),
                  Divider(
                    height: 1,
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
