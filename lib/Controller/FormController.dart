import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanmanagement/Apicalls/LoanApis.dart';
import 'package:loanmanagement/Models/AddEnquireModel.dart';
import 'package:loanmanagement/Models/DropdownModel.dart';

class FormController extends GetxController {
  var isBlank = false.obs;
  var isLoading=false.obs;
  var dropdownmodel = DropdownModel(paymentStatus: [],creditManager: [],salesManager: [],leadLevel: []).obs;
  var paymentstatus = 'Payment Status'.obs; // Default value
  var loantype = 'Loan Type'.obs; // Default value
  var enquirystatus = 'Enquiry Status'.obs; // Default value
  var applicant_type = 'Applicant Type Status'.obs; // Default value
  var leadlevel = 'Lead Level Status'.obs; // Default value
  var credit_manager = 'Credit Manager'.obs; // Default value
  var sales_manager = 'Sales Manager'.obs; // Default value
var leadlevelIdvalue=1.obs;
  var enquirystatusId=1.obs;
  var birthdate = TextEditingController().obs;
  var mothername = TextEditingController().obs;
  var nextAppointment=TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    getAlldropDownData();
  }

void updateDate(String date){
  birthdate.value.text=date;
}

void nextAppointmentdate(String date){
  nextAppointment.value.text=date;
}

void uodateDropdown(String value){
  paymentstatus(value);
}
void loantypedata(String value){
  loantype(value);
}
void enquirystatusdata(String value){
  enquirystatus(value);
}
void applicantType(String value){
  applicant_type(value);
}
void leadleveldata(String value){
  leadlevel(value);
}


void leadlevelvaluein(int value){
  leadlevelIdvalue(value);

}

void enquiryStatusIddd(int value){
  enquirystatusId(value);
}
void creditManager(String name){
  credit_manager(name);
}
void salesManager(String  Name){
  sales_manager(Name);
}


  Future<void> getAlldropDownData() async {
    print("Fetching dropdown data...");
    isBlank(true);
    dropdownmodel.value = await APiClls.getAllDerpdownData();
    if ((dropdownmodel.value.paymentStatus??[]).isNotEmpty) {
      paymentstatus.value = (dropdownmodel.value.paymentStatus??[]).first.paymentStatus??""; // Set default value
      loantype.value = (dropdownmodel.value.loanType??[]).first.loanType??""; // Set default value
      enquirystatus.value = (dropdownmodel.value.enquiryStatus??[]).first.enquiryStatus??""; // Set default value
       applicant_type.value = (dropdownmodel.value.applicantType??[]).first.applicantType??""; // Set default value
       leadlevel.value = (dropdownmodel.value.leadLevel??[]).first.leadLevel??""; // Set default value
      isBlank(false);
    } else {
      isBlank(false);
      print("No payment status data available.");
    }
  }



  Future<void> addEnquireDetails(AddEnquireModel enquireModel)async{
    isLoading(true);
    await APiClls.addEnquiryData(enquireModel);
    isLoading(false);

  }
}
