import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanmanagement/Apicalls/LoanApis.dart';
import 'package:loanmanagement/Models/loancaseModels/AbbModel.dart';
import 'package:loanmanagement/Services/LocalData.dart';

class abbdetailsController extends GetxController{


  var abbdataList=<Abb_Model>[].obs;

  var onday1=TextEditingController().obs;
  var onday5=TextEditingController().obs;
  var onday10=TextEditingController().obs;
  var onday15=TextEditingController().obs;
  var onday20=TextEditingController().obs;
  var onday25=TextEditingController().obs;
  var monthlist=TextEditingController().obs;
var monthind=0.obs;
 List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
var isBalank=false.obs;

    void onInit() {
 super.onInit();
fetchAbb();
  }




void setdataonDay1(String data){
  onday1.value.text=data;
}
void setdataonDay5(String data){
  onday5.value.text=data;
}
void setdataonDay10(String data){
  onday10.value.text=data;
}
void setdataonDay15(String data){
  onday15.value.text=data;
}
void setdataonDay20(String data){
  onday20.value.text=data;
}
void setdataonDay25(String data){
  onday25.value.text=data;
}
void setmonthslist(String data,int ind){
  print(ind);
   monthind(ind);
  monthlist.value.text=data;
 
}


  Future<void> fetchAbb()async{
  isBalank(true);
  abbdataList.value= await APiClls.fetchAbbdetiasl();
  if(abbdataList.value.isEmpty){
    isBalank(false);
  }
  else{
    isBalank(false);
  }

  }


void addAbbDetails()async{
  DateTime date=DateTime.now();
Map<String,dynamic> data= {
    "loan_case_id": "${SharedPreferencesService.getInt("enquireid")}",
    "on_day_1": "${onday1.value.text}",
    "on_day_5": "${onday5.value.text}",
    "on_day_10": "${onday10.value.text}",
    "on_day_15": "${onday15.value.text}",
    "on_day_20": "${onday20.value.text}",
    "on_day_25": "${onday25.value.text}",
    "month": "${monthind.value}",
    "year": "${date.year}",
    "created_by": "${SharedPreferencesService.getInt("user_id")}"
};

await APiClls.addabbDetails(data);

print(data);
fetchAbb();



}







}