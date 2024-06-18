
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanmanagement/Controller/loancase/QuistionController.dart';

class CheckboxData extends StatelessWidget {
   CheckboxData({super.key,required this.Questiontext,required this.category,required this.val,required this.onChange});
String Questiontext,category;
int val;
Function (int)onChange;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title:Text(Questiontext,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),) ,
      trailing:   Checkbox(
            fillColor: MaterialStatePropertyAll(Colors.green.shade300),
            value: (val==1)?true:false, onChanged: ((value) {onChange(val);}))
          );
  }
}