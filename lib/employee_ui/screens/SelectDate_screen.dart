import 'package:flutter/material.dart';
import 'package:odoo_client/utilis/colors.dart';
import 'package:intl/intl.dart';
import 'package:odoo_client/widget/button.dart';

class SelectDate extends StatefulWidget {
  @override
  _SelectDateState createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  DateTime selectedDate = DateTime.now();
  final TimeOfDay selectedTime = TimeOfDay.now();
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final DateFormat timeformat = DateFormat('hh:mm');
  TextEditingController _date = new TextEditingController();
  TextEditingController _time = new TextEditingController();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));

    if (picked != null && picked != selectedDate)
      setState(() {
        final String formatted = formatter.format(selectedDate);
        _date.value = TextEditingValue(text: formatted.toString());
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: selectedTime);

    if (picked != null && picked != selectedTime)
      setState(() {
        final String formatted = timeformat.format(selectedDate);
        _time.value = TextEditingValue(text: formatted.toString());
      });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double l = MediaQuery.of(context).size.longestSide;
    Orientation orien = MediaQuery.of(context).orientation;
    bool screen = orien == Orientation.portrait ? true : false;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Task Creation"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
                child: Text(
                  "Select Date",
                  style: TextStyle(color: main_color),
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                    width: width * 0.4,
                    child: GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: _date,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            labelText: 'Start Date',
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  width: width * 0.06,
                ),
                Container(
                    width: width * 0.4,
                    child: GestureDetector(
                      onTap: () => _selectTime(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: _time,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            labelText: 'Start Time',
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Container(
          width: width,
          child: SignButton(
              screen: screen,
              width: screen ? width * 0.8 : height * 0.1,
              height: screen ? width * 0.14 : height * 0.1,
              txt: "Done",
              txtColor: Colors.white,
              buttonColor: Colors.blue,
              borderColor: Colors.transparent,
              onPressed: () {}),
        ),
      ),
    );
  }
}
