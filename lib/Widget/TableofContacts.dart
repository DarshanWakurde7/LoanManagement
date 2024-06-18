import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanmanagement/Controller/loancase/ApplicationDetailsController.dart';


class Tableofcontact extends StatelessWidget {
   Tableofcontact({super.key,required this.applicattype,required this.Name,required this.phone,required this.cibil,required this.id,required this.onTapButton});
String applicattype,Name;
int id,phone,cibil;
Function onTapButton;
ApplicationController applicationController=Get.put(ApplicationController());
  @override
  Widget build(BuildContext context) {
    return Table(
defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
          columnWidths: {
           0: FixedColumnWidth(135),
           1: FixedColumnWidth(105),
           2: FixedColumnWidth(70),
           3: FixedColumnWidth(30),
          },
      children: [
           TableRow(
            
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black))
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                    Text("${applicattype}",textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.w500),),

                      Text("${Name}",textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.w400),),
                    
                  
                     
                    ]
                  ),
                ),
                   Padding(
                     padding: const EdgeInsets.all(2.0),
                     child: Text("${phone}"),
                   ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text("${cibil}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: ()=>onTapButton(),
                        child: Icon(Icons.delete)),
                    ),
              ]
            ),
      ],
    );
  }
}