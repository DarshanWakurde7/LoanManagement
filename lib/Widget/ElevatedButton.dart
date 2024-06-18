
import 'package:flutter/material.dart';

class MyElevatedbutton extends StatelessWidget {
   MyElevatedbutton({super.key,required this.text,required this.onPressed});
String text;
Function onPressed;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      
      style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.black),
                  minimumSize: MaterialStatePropertyAll(Size(500, 40)),
                  surfaceTintColor: MaterialStatePropertyAll(Colors.black)),
      onPressed: ()=>onPressed, child: Text(text,style: TextStyle(color: Colors.white),));
  }
}