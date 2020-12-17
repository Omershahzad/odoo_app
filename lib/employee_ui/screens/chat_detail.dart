import 'package:flutter/material.dart';
import 'package:odoo_client/utilis/images.dart';

class ChatDetail extends StatefulWidget {
  ChatDetail({Key key}) : super(key: key);

  @override
  _ChatDetailState createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: width,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(pic),
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
                          "Online",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.phone,
                  ),
                  Icon(Icons.video_call_outlined),
                  Icon(Icons.menu)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
