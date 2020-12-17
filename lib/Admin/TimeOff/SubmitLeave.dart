import 'package:flutter/material.dart';
import 'package:odoo_client/utilis/colors.dart';

class SubmitLeave extends StatefulWidget {
  @override
  _SubmitLeaveState createState() => _SubmitLeaveState();
}

class _SubmitLeaveState extends State<SubmitLeave> {
  List<String> _options = [
    'Sick Time Off',
    'Half Day',
    'Unpaid',
    'Casual Leave'
  ];
  String _selectedOption;
  final durationField = TextEditingController();
  final descriptionField = TextEditingController();

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: cg,
            accentColor: cg,
            colorScheme: ColorScheme.light(primary: cg),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  DateTime selectedDate1 = DateTime.now();
  Future<void> _selectDate1(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate1,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: cg,
            accentColor: cg,
            colorScheme: ColorScheme.light(primary: cg),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
    );

    if (picked != null && picked != selectedDate1)
      setState(() {
        selectedDate1 = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Card(
              elevation: 15,
              // color: Colors.grey,
              child: Container(
                height: 450,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Reason for Leave',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    Divider(
                      thickness: 2,
                      endIndent: 30,
                      indent: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20)),
                      child: DropdownButton(
                        underline: SizedBox(),
                        hint: Container(
                          width: 210,
                          child: Text(
                            '    Leave Type',
                            // textAlign: TextAlign.center,
                          ),
                        ), // Not necessary for Option 1
                        value: _selectedOption,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedOption = newValue;
                          });
                        },
                        items: _options.map((location) {
                          return DropdownMenuItem(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: new Text(location),
                            ),
                            value: location,
                          );
                        }).toList(),
                      ),
                    ),
                    //   Text("${selectedDate.toLocal()}".split(' ')[0]),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 22,
                        ),
                        Text(
                          "From :",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Container(
                              width: 200,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                  child: Text("${selectedDate.toLocal()}"
                                      .split(' ')[0]))),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 22,
                        ),
                        Text(
                          "To :",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        GestureDetector(
                          onTap: () => _selectDate1(context),
                          child: Container(
                              width: 200,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                  child: Text("${selectedDate1.toLocal()}"
                                      .split(' ')[0]))),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 22,
                        ),
                        Text(
                          "Description :",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 158,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)),
                          child: TextField(
                            keyboardType: TextInputType.name,
                            controller: descriptionField,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(12, 8, 18, 12),
                                border: InputBorder.none,
                                hintText: ''),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 22,
                        ),
                        Text(
                          "Duration :",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: durationField,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(42, 12, 30, 12),
                                border: InputBorder.none,
                                hintText: '1'),
                          ),
                        ),
                        Text(
                          _selectedOption == 'Half Day'
                              ? "   Hours"
                              : "    Days",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: 200,
                        height: 40,
                        decoration: BoxDecoration(
                            color: cg, borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Text(
                          "Apply",
                          style: TextStyle(color: Colors.white),
                        ))),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
