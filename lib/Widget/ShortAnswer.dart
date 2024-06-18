
import 'package:flutter/material.dart';
import 'package:loanmanagement/Widget/ElevatedButton.dart';

class ShortAnswer extends StatelessWidget {
   ShortAnswer({super.key,required this.Questiontext,required this.category,});
String Questiontext,category;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5,),
          Text(Questiontext,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
          SizedBox(height: 8,),
          TextField(
            maxLines: 2,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(3),borderSide: BorderSide(width: 0.5))
            ),
          ),
           SizedBox(height: 4,),
         MyElevatedbutton(onPressed: (){
          print("okk");
         },text: "Save",)
        ],
      ),
    );
  }
}
