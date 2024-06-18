import 'package:flutter/material.dart';

class TextfiledWidget extends StatelessWidget {
  TextfiledWidget({
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
          SizedBox(height: 2),
          TextField(
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