import 'package:flutter/material.dart';
import 'package:odoo_client/utilis/images.dart';
import 'chat_detail.dart';

class ContactScreen  extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Row(children: [
              GestureDetector (onTap:() {
                Navigator.pop(context);
              },child: Icon(Icons.arrow_back_ios_sharp,size: 18,)),
              SizedBox(width: 20,),
              Text("Contacts",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
            ],),
          ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyChatScreen()));
                    },
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
                            Text("Reanne Dudley",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "3 Mutual Friends",
                              style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffe8ebf4),
                            borderRadius: BorderRadius.circular(18)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Invite",
                            style: TextStyle(
                                color: Color(0xff9ca3ab), fontSize: 12,fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyChatScreen()));
                    },
                    child: Row(children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage("https://www.matthallwritescopy.com/wp-content/uploads/2014/06/new-profile-photo-circle-400x400.png"),
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
                            Text("Samson Bason",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "1 Mutual Friends",
                              style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffe8ebf4),
                            borderRadius: BorderRadius.circular(18)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Invite",
                            style: TextStyle(
                                color: Color(0xff9ca3ab), fontSize: 12,fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyChatScreen()));
                    },
                    child: Row(children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage("https://caitlinball.com/wp-content/uploads/2016/12/circle_profile.png"),
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
                            Text("Calista Gracia",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "3 Mutual Friends",
                              style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffe8ebf4),
                            borderRadius: BorderRadius.circular(18)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Invite",
                            style: TextStyle(
                                color: Color(0xff9ca3ab), fontSize: 12,fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyChatScreen()));
                    },
                    child: Row(children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage("https://www.vhv.rs/dpng/d/551-5511364_circle-profile-man-hd-png-download.png"),
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
                            Text("Calista Gracia",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Unkown",
                              style: TextStyle(color: Colors.grey,fontSize: 12,fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xffe8ebf4),
                            borderRadius: BorderRadius.circular(18)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Send Request",
                            style: TextStyle(
                                color: Color(0xff9ca3ab), fontSize: 12,fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyChatScreen()));
                    },
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff9ca3ab),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Center(
                              child: Text(
                                "?",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 19,fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text("Contacts Help",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold,color: Colors.grey)),
                      Spacer(),

                    ]),
                  ),
                ),
              ],
            )],
        ),
      ),
    );
  }
}
