
import 'package:flutter/material.dart';
import 'package:loanmanagement/Models/loancaseModels/QuestionModel.dart';
import 'package:loanmanagement/Widget/DropdoewnDesign.dart';

class SingleChoice extends StatelessWidget {
   SingleChoice({super.key,required this.Questiontext,required this.textEditingController,required this.option,required this.onChangedData});
String Questiontext;
TextEditingController textEditingController;
List<DropdownMenuEntry> option;
   Function(String) onChangedData;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      
                DropdownUni( fieldName: Questiontext,textcontroller: textEditingController,onChangedData:(val)=>onChangedData(val) ,listdata: option,)
     
        ],
      ),
    );
  }
}
