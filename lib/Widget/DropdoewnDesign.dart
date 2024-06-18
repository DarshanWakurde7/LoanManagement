import 'package:flutter/material.dart';

class DropdownUni extends StatelessWidget {
  DropdownUni({
    super.key,
    required this.fieldName,
    required this.textcontroller,
    required this.onChangedData,
    required this.listdata  // Add this line
  });

  final String fieldName;
  final TextEditingController textcontroller;
  final Function(String) onChangedData;
  List<DropdownMenuEntry> listdata;  // Add this line

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
           DropdownMenu(

              onSelected: (value) => onChangedData(value),
          menuHeight: 250,
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: EdgeInsets.only(left: 10),
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide.none)),
          menuStyle: MenuStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey.shade200)),
          controller:textcontroller ,
          width: MediaQuery.of(context).size.width*0.5,
          expandedInsets: EdgeInsets.zero,
          dropdownMenuEntries: listdata,),
        ],
      ),
    );
  }
}