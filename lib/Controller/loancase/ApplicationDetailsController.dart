

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanmanagement/Apicalls/LoanApis.dart';
import 'package:loanmanagement/Models/DropdownModel.dart';
import 'package:loanmanagement/Models/loancaseModels/ContactDetailsModel.dart';
import 'package:loanmanagement/Models/loancaseModels/RTRModel.dart';
import 'package:loanmanagement/Models/loancaseModels/contactType.dart';
import 'package:loanmanagement/Services/LocalData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplicationController extends GetxController{

var currentIndex=0.obs;
var dropdown=<ContacTypeModel> [].obs;

var contactDetaislApplication=<ContactDetailsApplicant>[].obs;
var dropdownmodel = DropdownModel(paymentStatus: [],creditManager: [],salesManager: [],leadLevel: []).obs;

var rtrListData=<RTRModel>[].obs;
List<String> ApplicationDetialssubmenu=["Contact List","RTR","ITR","ABB"];

var contacttype=TextEditingController().obs;
var isBalank=false.obs;
var Name=TextEditingController().obs;
var Phone=TextEditingController().obs;
var Cibilscore=TextEditingController().obs;
var contacttypeid=0.obs;
var porductsid=0.obs;



var financeName=TextEditingController().obs;
var productS=TextEditingController().obs;
var sanctionAmount=TextEditingController().obs;
var opendate=TextEditingController().obs;
var EmiAmountdata=TextEditingController().obs;
var tenuredata=TextEditingController().obs;
var emidatedata=TextEditingController().obs;
var emibankdata=TextEditingController().obs;
var ebanknamedata=TextEditingController().obs;
var emibanktype=TextEditingController().obs;
var outStandingdata=TextEditingController().obs;
var closerdatedata=TextEditingController().obs;


void setcloserdatedata(String val){
  closerdatedata.value.text=val;
}
void setoutStandingdata(String val){
  outStandingdata.value.text=val;
}
void setebanknamedata(String val){
  ebanknamedata.value.text=val;
}
void setfinanceName(String val){
  financeName.value.text=val;
}
void setemibankdata(String val){
  emibankdata.value.text=val;
}
void setemidatedata(String val){
  emidatedata.value.text=val;
}
void settenuredata(String val){
  tenuredata.value.text=val;
}
void setEmiAmountdata(String val){
  EmiAmountdata.value.text=val;
}
void setemibanktype(String val){
  emibanktype.value.text=val;
}
void setopendate(String val){
  opendate.value.text=val;
}
void setsanctionAmount(String val){
  sanctionAmount.value.text=val;
}
void setProducts(String val,int porductsval){
  productS.value.text=val;
  porductsid(porductsval);
}














  void onInit() {
 super.onInit();
 getAlldropDownData();
FetchAllContacts();
fetchRtrList();
  }


  Future<void> FetchAllContacts()async{
  isBalank(true);
  contactDetaislApplication.value= await APiClls.fetchContactApplicationDetails();
  if(contactDetaislApplication.value.isEmpty){
    isBalank(false);
  }
  else{
    isBalank(false);
  }

  }
  Future<void> fetchRtrList()async{
  isBalank(true);
  rtrListData.value= await APiClls.fetchRtrDetailsList();
  if(rtrListData.value.isEmpty){
    isBalank(false);
  }
  else{
    isBalank(false);
  }

  }





void addContactDetails()async{
Map<String,dynamic> data= {
    "loan_case_id":"${SharedPreferencesService.getInt("enquireid")??0}",
    "contact_type":contacttypeid.value.toString(),
    "contact_name":Name.value.text,
    "contact_cibil":"${int.parse(Cibilscore.value.text)}",
    "contact_phone":"${int.parse(Phone.value.text)}"
};



await APiClls.addContactApplicationDetails(data);




}




Future<void> delete_contact(int id)async{

        await APiClls.deleteContactData(id);

}
Future<void> delete_RtrDetails(int id)async{

        await APiClls.deleteData(id);

}


Future<void> addRtrDetials()async{
Map<String,dynamic> data= {
    "loan_case_id": "${SharedPreferencesService.getInt("enquireid")??0}",
    "financer_name": financeName.value.text,
    "products": "${porductsid.value}",
    "sanction_amount": "${sanctionAmount.value.text}",
    "open_date": opendate.value.text,
    "emi_amount": EmiAmountdata.value.text,
    "tenure": tenuredata.value.text,
    "emi_date": emidatedata.value.text,
    "emi_bank_name": ebanknamedata.value.text,
    "emi_bank_type": emibanktype.value.text,
    "out_standing": outStandingdata.value.text,
    "emi_closer_date": closerdatedata.value.text,
    "created_by": "1"
};



await APiClls.addRtrApplicationdetiasl(data);

fetchRtrList();


}



  

Future<void> getAlldropDownData() async {
    print("Fetching dropdown data...");

    dropdown.value=await APiClls.getContactDropdoen();
        dropdownmodel.value = await APiClls.getAllDerpdownData();

    if ((dropdown.value??[]).isNotEmpty) {
      // paymentstatus.value = (dropdownmodel.value.paymentStatus??[]).first.paymentStatus??""; // Set default value
      productS.value.text = "Choose one"; // Set default value
      // enquirystatus.value = (dropdownmodel.value.enquiryStatus??[]).first.enquiryStatus??""; // Set default value
       contacttype.value.text = "Choose one"; // Set default value
      //  leadlevel.value.text = (dropdownmodel.value.leadLevel??[]).first.leadLevel??""; // Set default value
      //  salesManager.value.text = (dropdownmodel.value.salesManager??[]).first.fullName??""; // Set default value

    } else {
    
      print("No payment status data available.");
    }
    print(dropdown.value);
  }











void setContactType(String type,int id){
contacttype.value.text=type;
contacttypeid(id);
}
void setname(String val){
Name.value.text=val;
}
void setphone(String val){
Phone.value.text=val;
}
void setcibil(String val){
Cibilscore.value.text=val;
}
void setcurrentIndex(int value){
  currentIndex(value);
}

}