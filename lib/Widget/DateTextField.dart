import 'package:flutter/material.dart';

class DateTimeTextfiledWidget extends StatelessWidget {
  DateTimeTextfiledWidget({
    super.key,
    required this.fieldName,
    required this.textcontroller,
    required this.onChangedData,
    required this.inputType  // Add this line
  });

  final String fieldName;
  final TextEditingController textcontroller;
  final Function(String) onChangedData;
  TextInputType inputType;  // Add this line

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldName,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
          SizedBox(height: 3),
          TextField(
            controller: textcontroller,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: ()async{
                  DateTime? dateTime=await showDatePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime(2100));
                String datetime=( dateTime!=null)?"${dateTime.year}-${dateTime.month}-${dateTime.day}":"";
                onChangedData(datetime);
                },
                child: Icon(Icons.calendar_month)),
              contentPadding: EdgeInsets.all(5),
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
            keyboardType: inputType,
           
          ),
        ],
      ),
    );
  }
}