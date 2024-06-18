
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:loanmanagement/Controller/loancase/abbdetails/abbdetails.dart';
import 'package:loanmanagement/Widget/DropdoewnDesign.dart';
import 'package:loanmanagement/Widget/textfield.dart';

class AbbdetiaslScreen extends StatelessWidget {
  
   AbbdetiaslScreen({super.key});

   abbdetailsController abbcontroller=Get.put(abbdetailsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("RTR",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                ElevatedButton(onPressed: (){

                        showDialog(context: context, builder: (context){
                              return Dialog(

                                surfaceTintColor: Colors.white,
                                backgroundColor: Colors.white,
                                child: Container(
                                  height: 600,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                    
                                        SizedBox(height:10),
                                                                
                                            Padding(
                                              padding: const EdgeInsets.all(15.0),
                                              child: Text("Add ABB data",style: TextStyle(fontSize: 19.5,fontWeight: FontWeight.w500),),
                                            ),

                                              TextfiledWidget(fieldName: "ON Day 1", textcontroller: abbcontroller.onday1.value, onChangedData: (val){
                                                        abbcontroller.setdataonDay1(val);
                                                      }, inputType: TextInputType.number),
                                    
                                              TextfiledWidget(fieldName: "ON Day 5", textcontroller: abbcontroller.onday5.value, onChangedData: (val){
                                                        abbcontroller.setdataonDay5(val);
                                                      }, inputType: TextInputType.number),
                                    
                                              TextfiledWidget(fieldName: "ON Day 10", textcontroller: abbcontroller.onday10.value, onChangedData: (val){
                                                        abbcontroller.setdataonDay10(val);
                                                      }, inputType: TextInputType.number),
                                    
                                              TextfiledWidget(fieldName: "ON Day 15", textcontroller: abbcontroller.onday15.value, onChangedData: (val){
                                                        abbcontroller.setdataonDay15(val);
                                                      }, inputType: TextInputType.number),
                                    
                                              TextfiledWidget(fieldName: "ON Day 20", textcontroller: abbcontroller.onday20.value, onChangedData: (val){
                                                        abbcontroller.setdataonDay20(val);
                                                      }, inputType: TextInputType.number),
                                              TextfiledWidget(fieldName: "ON Day 25", textcontroller: abbcontroller.onday25.value, onChangedData: (val){
                                                        abbcontroller.setdataonDay25(val);
                                                      }, inputType: TextInputType.number),

                                    DropdownUni(fieldName: "Months", textcontroller:abbcontroller.monthlist.value , onChangedData: (val){

                              
                                  abbcontroller.setmonthslist(val, abbcontroller.months.indexOf(val));
                                      
                                 
                                    }, listdata: abbcontroller.months.map((e){
                                      return DropdownMenuEntry(value: e, label: e);
                                    }).toList()),
                                            SizedBox(height: 20,),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  ElevatedButton(
                                                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green.shade300)),
                                                    onPressed: (){
                                                      print("okk01");
                                                      Navigator.pop(context);
                                                      abbcontroller.addAbbDetails();

                                                    
                                                     
                                                    }, child: Text("Save Data",style: TextStyle(color: Colors.white),))
                                                ],
                                              ),
                                            )
                                      ]
                                    ),
                                  ),
                                ),
                              );
                        });

                }, child: Text("Add",style: TextStyle(color: Colors.white),),style: ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size(100, 38)),
           
            backgroundColor:MaterialStatePropertyAll(Colors.green.shade500) ),)
          ],
        ),


Container(

  width: double.infinity,
  height: MediaQuery.of(context).size.height*0.625,
  child: Obx(
 
    (){
      return HorizontalDataTable(
        
            leftHandSideColumnWidth: 100,
            rightHandSideColumnWidth: 850,
            isFixedHeader: true,
            headerWidgets: _getTitleWidget(),
            isFixedFooter: true,
            
            footerWidgets: [
              Text(""),
              Text(""),
              Text(""),
              Text(""),
              Text(""),
              Text(""),
              Text(""),
              Text(""),
              Text(""),
              Text(""),
              Text(""),
              ],
            leftSideItemBuilder: _generateFirstColumnRow,
            rightSideItemBuilder: _generateRightHandSideColumnRow,
            itemCount: abbcontroller.abbdataList.length,
            rowSeparatorWidget: const Divider(
              color: Colors.black38,
              height: 1.0,
              thickness: 0.0,
            ),
            leftHandSideColBackgroundColor: const Color(0xFFFFFFFF),
            rightHandSideColBackgroundColor: const Color(0xFFFFFFFF),
            itemExtent: 55,
          );
    }
  ),
    ),

       

      ],
    );
  }

  List<Widget> _getTitleWidget(){
    return [

      _getTitleItemWidget("Month",130),
      _getTitleItemWidget("On Day 1",130),
      _getTitleItemWidget("On Day 5",130),
      _getTitleItemWidget("On Day 10",100),
      _getTitleItemWidget("On Day 15",100),
      _getTitleItemWidget("On Day 20",100),
      _getTitleItemWidget("On Day 25",100),
      _getTitleItemWidget("Average",130),
      _getTitleItemWidget("Action",60)

    ];
  }


   Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 56,
      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      width: 130,
      height: 52,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(abbcontroller.abbdataList[index].month??"jan"),
    );
  }
    Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Obx(
     
      () {
        return Row(
          children: <Widget>[
        
            Container(
              width: 130,
              height: 52,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Center(child: Text("${abbcontroller.abbdataList[index].onDay1??0}")),
            ),
            Container(
              width: 130,
              height: 52,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Center(child: Text("${abbcontroller.abbdataList[index].onDay5??0}")),
            ),
            Container(
              width: 100,
              height: 52,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Center(child: Text("${abbcontroller.abbdataList[index].onDay10??5}")),
            ),
            Container(
              width: 100,
              height: 52,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Center(child: Text("${abbcontroller.abbdataList[index].onDay15??5}")),
            ),
            Container(
              width: 100,
              height: 52,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Center(child: Text("${abbcontroller.abbdataList[index].onDay20??0}")),
            ),
            Container(
              width: 100,
              height: 52,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Center(child: Text("${abbcontroller.abbdataList[index].onDay25??0}")),
            ),
            Container(
              width: 130,
              height: 52,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Center(child: Text("${abbcontroller.abbdataList[index].averageMonth}")),
            ),
       
            Container(
              width: 60,
              height: 52,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Center(child: Icon(Icons.delete),),
            ),
          ],
        );
      }
    );
  }
}