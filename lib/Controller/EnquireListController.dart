

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanmanagement/Apicalls/LoanApis.dart';
import 'package:loanmanagement/Models/DropdownModel.dart';
import 'package:loanmanagement/Models/EnquiryData.dart';
import 'package:loanmanagement/Services/LocalData.dart';
class EnquireConroller extends GetxController {

  var isLoading=false.obs;
  List<EnquiryModel> enquiremodel=<EnquiryModel>[].obs;
  var dropdownmodel = DropdownModel(paymentStatus: [],creditManager: [],salesManager: [],leadLevel: [],loanType: []).obs;

  var currentind=0.obs;
var fname=TextEditingController().obs;
var lname=TextEditingController().obs;
var requested_loan_amount=TextEditingController().obs;
var loantype=TextEditingController().obs;
var date=TextEditingController().obs;
var mail=TextEditingController().obs;
var phone=TextEditingController().obs;
var whatsapp_no=TextEditingController().obs;
var enqtype=TextEditingController().obs;
var enqid=0.obs;

void onInit() {
   getAlldropDownData();
 super.onInit();

 getAllEnquireData();
  }

  
  Future<void> getAllEnquireData()async{
    isLoading(true);
    enquiremodel=await APiClls.fetchEnquiries();
    if(enquiremodel.isEmpty){
      enquiremodel;
      Get.snackbar("Sorry No Data", "Sorry Data Not Availabe");
    }
    else{
        isLoading(false);
    }
      

  }

Future<void> getAlldropDownData() async {
    print("Fetching dropdown data...");

    dropdownmodel.value = await APiClls.getAllDerpdownData();

    if ((dropdownmodel.value.loanType??[]).isNotEmpty) {
      // paymentstatus.value = (dropdownmodel.value.paymentStatus??[]).first.paymentStatus??""; // Set default value
      loantype.value.text = "Select one"; // Set default value
      // enquirystatus.value = (dropdownmodel.value.enquiryStatus??[]).first.enquiryStatus??""; // Set default value
      //  applicant_type.value = (dropdownmodel.value.applicantType??[]).first.applicantType??""; // Set default value
      //  leadlevel.value.text = (dropdownmodel.value.leadLevel??[]).first.leadLevel??""; // Set default value
      //  salesManager.value.text = (dropdownmodel.value.salesManager??[]).first.fullName??""; // Set default value

    } else {
    
      print("No payment status data available.");
    }
    print(dropdownmodel.value.leadLevel!.length);
  }



void addEnqireData()async{


Map<String,dynamic> data={
    "fname": "${fname.value.text}",
    "lname": "${lname.value.text}",
    "phone": "${phone.value.text}",
    "whatsapp_no": "${whatsapp_no.value.text}",
    "email": "${mail.value.text}",
    "loan_type": "${enqid.value}",
    "enquiry_mode_id": "6",
    "required_loan_amount":"${requested_loan_amount.value.text}",
    "created_by": "${SharedPreferencesService.getInt("user_id")}"
};

await APiClls.addDataofENquireDetails(data);


}





  void setCurrentIndexValue(int val){
    currentind(val);
  }
  void setfname(String val){
    fname.value.text=val;
  }
  void setlname(String val){
    lname.value.text=val;
  }
  void setrequestedloanamount(String val){
    requested_loan_amount.value.text=val;
  }
  void setloantype(String val){
    loantype.value.text=val;
  }
  void setDate(String val){
    date.value.text=val;
  }
  void setMail(String val){
    mail.value.text=val;
  }
  void setPhone(String val){
    phone.value.text=val;
  }
  void setWhatsappno(String val){
    whatsapp_no.value.text=val;
  }
  void setenquireData(String val,int id){
    enqtype.value.text=val;
    enqid(id);
  }

  
}