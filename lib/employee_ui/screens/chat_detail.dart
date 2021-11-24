import 'package:dash_chat/dash_chat.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:odoo_client/utilis/colors.dart';
import 'package:odoo_client/utilis/images.dart';
import 'package:odoo_client/utilis/message.dart';

class MyChatScreen extends StatefulWidget {
  const MyChatScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyChatState createState() => new _MyChatState();
}

class _MyChatState extends State<MyChatScreen> {
  final List<Message> _messages = <Message>[];

  // Create a text controller. We will use it to retrieve the current value
  // of the TextField!
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd hh:mm').format(time);

    return new Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(180, 60),
          child: new AppBar(
              backgroundColor: Colors.white,
              leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back, color: Colors.black)),
              title: Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(pic),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("User 1",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Text(
                            "Online",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          //                     Spacer(),
                        ],
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.video_call_outlined,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.more_vert,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              )),
        ),
        body: new Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: new Container(
              child: new Column(
                children: <Widget>[
                  //Chat list
                  new Flexible(
                    child: new ListView.builder(
                      padding: new EdgeInsets.all(8.0),
                      reverse: true,
                      itemBuilder: (_, int index) => _messages[index],
                      itemCount: _messages.length,
                    ),
                  ),
                  new Divider(height: 1.0),
                  new Container(
                      decoration: new BoxDecoration(color: Colors.white),
                      child: new IconTheme(
                          data: new IconThemeData(
                              color: Theme.of(context).accentColor),
                          child: new Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: new Row(
                              children: <Widget>[
                                //left send button

                                new Container(
                                  width: 48.0,
                                  height: 48.0,
                                  child: new IconButton(
                                      icon: Icon(
                                        Icons.arrow_upward,
                                        color: cg,
                                      ),
                                      onPressed: () => _sendMsg(
                                          _textController.text,
                                          'left',
                                          formattedDate)),
                                ),

                                //Enter Text message here
                                new Flexible(
                                  child: new TextField(
                                    controller: _textController,
                                    decoration: new InputDecoration.collapsed(
                                        hintText: "Enter message"),
                                  ),
                                ),

                                //right send button
                                // new Container(
                                //   width: 48.0,
                                //   height: 48.0,
                                //   child: new IconButton(
                                //       icon: Icon(Icons.emoji_emotions_outlined,color: cg,),
                                //
                                //       onPressed: () => new EmojiPicker(
                                //         rows: 3,
                                //         columns: 7,
                                //         buttonMode: ButtonMode.MATERIAL,
                                //         recommendKeywords: ["racing", "horse"],
                                //         numRecommended: 10,
                                //         onEmojiSelected: (emoji, category) {
                                //           print(emoji);
                                //         },
                                //       )
                                //
                                //     ),
                                // ),

                                new Container(
                                  margin:
                                      new EdgeInsets.symmetric(horizontal: 2.0),
                                  width: 48.0,
                                  height: 48.0,
                                  child: new IconButton(
                                      icon: Icon(
                                        Icons.send,
                                        color: cg,
                                      ),
                                      onPressed: () => _sendMsg(
                                          _textController.text,
                                          'right',
                                          formattedDate)),
                                ),
                              ],
                            ),
                          ))),
                ],
              ),
            )));
  }

  void _sendMsg(String msg, String messageDirection, String date) {
    if (msg.length == 0) {
      Text("Please enter text");
      // Fluttertoast.showToast(
      //     msg: "Please Enter Message",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIos: 1,
      //     backgroundColor: Colors.blue);
    } else {
      _textController.clear();
      Message message = new Message(
        msg: msg,
        direction: messageDirection,
        dateTime: date,
      );
      setState(() {
        _messages.insert(0, message);
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.
    // Clean up the controller when the Widget is disposed
    _textController.dispose();
    super.dispose();
  }
}

// import 'package:flutter/material.dart';
// import 'package:odoo_client/utilis/colors.dart';
// import 'package:odoo_client/utilis/images.dart';
//
// class ChatDetail extends StatefulWidget {
//   ChatDetail({Key key}) : super(key: key);
//
//   @override
//   _ChatDetailState createState() => _ChatDetailState();
// }
//
// class _ChatDetailState extends State<ChatDetail> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               width: width,
//               height: 80,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(10),
//                       bottomRight: Radius.circular(10))),
//               child: Card(
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       width: 10,
//                     ),
//                     CircleAvatar(
//                       backgroundImage: AssetImage(pic),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(top: 18),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("User 1",
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.bold)),
//                           Text(
//                             "Online",
//                             style: TextStyle(color: Colors.grey),
//                           )
//                         ],
//                       ),
//                     ),
//                     Spacer(),
//                     Icon(
//                       Icons.phone,
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Icon(Icons.video_call_outlined),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Icon(Icons.more_vert),
//                     SizedBox(
//                       width: 10,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Align(
//                       alignment: Alignment.topRight,
//                       child: Container(
//                         margin: EdgeInsets.only(right: 20, top: 10),
//                         height: 40,
//                         width: 150,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.rectangle,
//                             border: Border.all(color: Colors.grey),
//                             borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(10),
//                                 topLeft: Radius.circular(10),
//                                 bottomRight: Radius.circular(10))),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text("What are you doing"),
//                         ),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: Container(
//                         margin: EdgeInsets.only(left: 20, top: 10),
//                         height: 50,
//                         width: 200,
//                         decoration: BoxDecoration(
//                             color: cg,
//                             shape: BoxShape.rectangle,
//                             borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(10),
//                                 topRight: Radius.circular(10),
//                                 bottomRight: Radius.circular(10))),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             "Nothing Special and you?",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.topRight,
//                       child: Container(
//                         margin: EdgeInsets.only(right: 20, top: 10),
//                         height: 80,
//                         width: 250,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.rectangle,
//                             border: Border.all(color: Colors.grey),
//                             borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(10),
//                                 topLeft: Radius.circular(10),
//                                 bottomRight: Radius.circular(10))),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                               "What are you doing,What are you doing,What are you doing,What are you doing,What are you doing"),
//                         ),
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: Container(
//                         margin: EdgeInsets.only(left: 20, top: 10),
//                         height: 80,
//                         width: 250,
//                         decoration: BoxDecoration(
//                             color: cg,
//                             shape: BoxShape.rectangle,
//                             borderRadius: BorderRadius.only(
//                                 bottomLeft: Radius.circular(10),
//                                 topRight: Radius.circular(10),
//                                 bottomRight: Radius.circular(10))),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             "Nothing Special and you?Nothing Special and you?Nothing Special and you?Nothing Special and you?",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//       bottomSheet: Container(
//         child: TextField(
//           decoration: InputDecoration(hintText: 'Type messssag here..'),
//         ),
//       ),
//     );
//   }
// }
