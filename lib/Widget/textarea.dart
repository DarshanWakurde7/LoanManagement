import 'package:flutter/material.dart';

class Textarea extends StatelessWidget {
 Textarea({super.key,required this.fieldName,required this.textcontroller,required this.onChangedData,required this.inputType});

 String fieldName;
 TextEditingController textcontroller;
 Function(String) onChangedData;
 TextInputType inputType;

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
          SizedBox(height: 2),
          TextField(
            maxLines: 3,
            controller: textcontroller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5),
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
            keyboardType: inputType,
            onChanged: (value) => onChangedData(value),  // Add this line
          ),
        ],
      ),
    );
  }
}