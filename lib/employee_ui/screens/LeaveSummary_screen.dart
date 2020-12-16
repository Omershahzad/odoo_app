import 'package:flutter/material.dart';

class LeaveSummaryScreen  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap:(){
          Navigator.pop(context);
        },child: Icon(Icons.arrow_back)),
        title: Text("Leave Summary"),
      ),
      body: Column(
        children: [
          Container(

          )
        ],
      ),
    );
  }
}
