import 'package:flutter/material.dart';
import 'package:odoo_client/utilis/colors.dart';

class AdvanceRequest extends StatefulWidget {
  @override
  _AdvanceRequestState createState() => _AdvanceRequestState();
}

class _AdvanceRequestState extends State<AdvanceRequest> {
  List<String> _options = [
    'January',
    'Febuary',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cg,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Card(
              elevation: 15,
              shadowColor: c5,
              // color: Colors.grey,
              child: Container(
                height: 400,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Application for Advance',
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
                            '   Select Month',
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
                    Container(
                      width: 250,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20)),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: descriptionField,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(12, 8, 18, 12),
                            border: InputBorder.none,
                            hintText: 'Amount'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "      Date :",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Container(
                          width: 250,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                                  "${selectedDate.toLocal()}".split(' ')[0]))),
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        width: 150,
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
