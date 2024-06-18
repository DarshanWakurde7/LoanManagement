import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:loanmanagement/Models/AddEnquireModel.dart';
import 'package:loanmanagement/Models/CityDropdownModel.dart';
import 'package:loanmanagement/Models/DashboardCount.dart';
import 'package:loanmanagement/Models/DropdownModel.dart';
import 'package:loanmanagement/Models/EnquiryData.dart';
import 'package:loanmanagement/Models/Logindata.dart';
import 'package:loanmanagement/Models/loancaseModels/AbbModel.dart';
import 'package:loanmanagement/Models/loancaseModels/ContactDetailsModel.dart';
import 'package:loanmanagement/Models/loancaseModels/ItrModel.dart';
import 'package:loanmanagement/Models/loancaseModels/PersonalDetial.dart';
import 'package:loanmanagement/Models/loancaseModels/PersonalinforModel.dart';
import 'package:loanmanagement/Models/loancaseModels/QuestionModel.dart';
import 'package:loanmanagement/Models/loancaseModels/RTRModel.dart';
import 'package:loanmanagement/Models/loancaseModels/contactType.dart';
import 'package:loanmanagement/Screens/LoancaseScreens/PersonalDetail.dart';
import 'package:loanmanagement/Services/LocalData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APiClls{


 static String baseurl="https://lomnith-dev.portalwiz.in/api/public/api";


 static Future<bool> login(String username,String Password)async{
   
    try{
     

      final response= await http.post(Uri.parse("${baseurl}/login"),body:{

    "username": username,
    "password": Password
} );
Data data=Data();


for(Map<String,dynamic> i in jsonDecode(response.body)["data"]){
data=Data.fromJson(i);
}

print(response.body);
SharedPreferencesService.setInt("account_id", data.accountId??0);
SharedPreferencesService.setInt("user_id", data.userId??0);
SharedPreferencesService.setInt("role_id", data.roleId??0);
SharedPreferencesService.setString("name", ("${data.firstName??""} ${data.lastName??""}"));


return jsonDecode(response.body)["success"];

    }
    catch (e){
Get.snackbar('Error', '${e.toString()}');
print(e.toString());
return false;
    }

  }



static Future<List<EnquiryModel>> fetchEnquiries() async {
    List<EnquiryModel> enquiryModelList = [];

    DateTime dateTime=DateTime.now();
    try {

      DateTime date=DateTime.now();
      final response = await http.post(
        Uri.parse('${baseurl}/filtered_enquiries'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
    "account_id": "1",
    // "enquiry_status_id": [
    //     19
    // ],
    "assigned_to": null,
    "created_from_date": "09/24/2022",
    "created_to_date": "${date.month}/${date.day}/${date.year}",
    "updated_from_date": null,
    "updated_to_date": null,
    "enquiry_from_date": null,
    "enquiry_to_date": null,
    "enq_count": "50"
}),
      );

      

      if (response.statusCode == 200) {
       for(Map<String,dynamic> i in jsonDecode(response.body)){
        
                  enquiryModelList.add(EnquiryModel.fromJson(i));
       }
       print(enquiryModelList.length);
       return enquiryModelList;
      } else {
        Get.snackbar("Error", "Failed to load enquiries: ${response.statusCode}");
        return enquiryModelList;
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Failed to load enquiries: $e");
       return enquiryModelList;
    }
   
  }


static Future<DropdownModel> getAllDerpdownData()async{

DropdownModel dropdownModel=DropdownModel();
try{
        final response =await http.get(Uri.parse("${baseurl}/enquiry_dropdown/${SharedPreferencesService.getInt("account_id")??1}"));
     
     dropdownModel=DropdownModel.fromJson(jsonDecode(response.body));
   
     print(response.body);
    
     print("${SharedPreferencesService.getInt("account_id")}");
return dropdownModel;
}catch (e){
  Get.snackbar("Sorry!!", "Something went Wrong");
  return dropdownModel;
}


}



static Future<void> addEnquiryData(AddEnquireModel addEnquireModel) async{

 try{

   final response=await http.post(Uri.parse("${baseurl}/add_enquiry"),body: {
    "fname": "${addEnquireModel.fname}",
    "lname": "${addEnquireModel.lname}",
    "phone": "${addEnquireModel.phone}",
    "whatsapp_no": "${addEnquireModel.whatsappNo}",
    "enquiry_mode_id": "${addEnquireModel.enquiryModeId}",
    "data_source": "${addEnquireModel.dataSource}",
    "email": "${addEnquireModel.email}",
    "account_id": "${SharedPreferencesService.getInt("accountid")}",
    "enquiry_status_id": "${addEnquireModel.enquiryStatusId}",
    "created_by": "${SharedPreferencesService.getInt("userid")??1}",
    "assigned_to": "2",
    "state": "${addEnquireModel.state}",
    "city": "${addEnquireModel.city}",
    "pin": "${addEnquireModel.pin}",
    "company_name": "${addEnquireModel.companyName}",
    "address": "${addEnquireModel.address}",
    "pan_number": "${addEnquireModel.panNumber}",
    "date_of_birth": "${addEnquireModel.dateOfBirth}",
    "enquiry_date": "${addEnquireModel.enquiryDate}",
    "loan_type": "${addEnquireModel.loanType}",
    "loan_amount": "${addEnquireModel.loanAmount}",
    "disbursed_lone_amount": "${addEnquireModel.disbursedLoneAmount}",
    "partner_commision_percentage": "${addEnquireModel.partnerCommisionPercentage}",
    "partner_commision_amount": "${addEnquireModel.partnerCommisionAmount}",
    "next_appointment_date": "${addEnquireModel.nextAppointmentDate}",
    "enq_detail_msg": "${addEnquireModel.enqDetailMsg}",
    "lead_level_id": "${addEnquireModel.leadLevelId}",
    "estimated_closure_date": "${addEnquireModel.estimatedClosureDate}",
    "notes": "${addEnquireModel.notes}",
    "business_name": "${addEnquireModel.businessName}",
    "sales_manager": "${addEnquireModel.salesManager}",
    "credit_manager": "${addEnquireModel.creditManager}",
    "cibil_score": "${addEnquireModel.cibilScore}",
    "current_ownership": "${addEnquireModel.currentOwnership}",
    "permanent_ownership": "${addEnquireModel.permanentOwnership}",
    "profile": "${addEnquireModel.profile}",
    "already_applied": "${addEnquireModel.alreadyApplied}",
    "dist_location": "${addEnquireModel.distLocation}",
    "live_loan": "${addEnquireModel.liveLoan}",
    "required_loan_amount": "${addEnquireModel.requiredLoanAmount}",
    "office_location": "${addEnquireModel.officeLocation}",
    "solution_for_process": "${addEnquireModel.solutionForProcess}",
    "rejection_reason": "${addEnquireModel.rejectionReason}",
    "Recall_date": "${addEnquireModel.recallDate}",
    "closer_date": "${addEnquireModel.closerDate}"
});


 }
catch(e){

}


}



static Future<List<QuestionData>> callQuestionApis()async{

List<QuestionData> question=[];
try{
  final response=await http.post(Uri.parse("https://lomnith-dev.portalwiz.in/api/public/api/quiz_questions"),body: {
  "loan_case_id":"${SharedPreferencesService.getInt("enquireid")??1}",
});

print(response.body);

for(Map<String,dynamic> i in jsonDecode(response.body)["data"]){
question.add(QuestionData.fromJson(i));
}
return question;
}catch (e){
  print(e);
return question;
}





}



static Future<List<CityDropdownModel>> getCityDropdown(int stateid)async{

List<CityDropdownModel> dropdownModel=[];
print(stateid);
try{
        final response =await http.post(Uri.parse("${baseurl}/fetch_city"),body: {"state_id":"${stateid}"});
     
    for(Map<String,dynamic> i in jsonDecode(response.body)){
            dropdownModel.add(CityDropdownModel.fromJson(i));
    }
return dropdownModel;
}catch (e){
  Get.snackbar("Sorry!!", "Something went Wrong");
  return dropdownModel;
}


}




static Future<void> addLoanCasePersonalInformaition(PersonalInformation personalnformation)async{


try{
        final response =await http.post(Uri.parse("${baseurl}/edit_personal_info"),body: {
          "loan_case_id":"${SharedPreferencesService.getInt("LoanCase_id")}",
    "fname": "${personalnformation.fname}",
    "lname": "${personalnformation.lname}",
    "phone": "${personalnformation.phone}",
    "whatsapp_no": "${personalnformation.whatsappNo}",
    "email": "${personalnformation.email}",
    "account_id": "${personalnformation.accountId}",
    "mother_name": "${personalnformation.motherName}",
    "created_by": "${personalnformation.createdBy}",
    "sales_manager": "${personalnformation.salesManager}",
    "state": "${personalnformation.state}",
    "city": "${personalnformation.city}",
    "pin": "${personalnformation.pin}",
    "company_name": "${personalnformation.companyName}",
    "current_address": "${personalnformation.currentAddress}",
    "permanent_address": "${personalnformation.permanentAddress}",
    "pan_number": "${personalnformation.panNumber}",
    "date_of_birth": "${personalnformation.dateOfBirth}",
    "enquiry_date": "${personalnformation.caseDate}",
    "loan_type": "${personalnformation.loanType}",
    "business_name": "${personalnformation.businessName}",
    "credit_manager": "${personalnformation.creditManager}",
    "cibil_score": "${personalnformation.cibilScore}",
    "office_residential_ownership": "${personalnformation.residentialOfficeOwnership}",
    "office_permanent_ownership": "${personalnformation.commercialOfficeOwnership}",
    "home_residential_ownership": "${personalnformation.permanentHomeOwnership}",
    "home_permanent_ownership": "${personalnformation.residentialHomeOwnership}",
    "business_profile": "${personalnformation.businessName}",
    "already_applied": "${personalnformation.alreadyApplied}",
    "dist_location": "${personalnformation.distLocation}",
    "live_loan": "${personalnformation.liveLoan}",
    "requested_loan_amount": "${personalnformation.requestedLoanAmount}",
    "office_location": "${personalnformation.officeAddress}",
    "gender": "${personalnformation.gender}"
});
     print(response.body);
     print(jsonDecode(response.body)["success"]);

if(jsonDecode(response.body)["success"]){
SharedPreferencesService.setInt("loan_case_id", jsonDecode(response.body)["loan_case_id"]);
Get.snackbar("Personal Info Status", jsonDecode(response.body)["message"]);
print(response.body);
}
else{
    Get.snackbar("Sorry!!", "Something went Wrong");
}

}catch (e){
  Get.snackbar("Sorry!!", "Something went Wrong");

}


}


static Future<PersonalInformation> fetchPersonalInfodetail()async{
PersonalInformation personalnformation;
final response=await http.post(Uri.parse("${baseurl}/get_personal_info",),body: {
    "loan_case_id":"${SharedPreferencesService.getInt("enquireid")??1}",

});
print(response.body);
personalnformation=PersonalInformation.fromJson(jsonDecode(response.body));
return personalnformation;
}


static Future<String> addPersonalDetials(PersonalDetialsModel personalDetailmodel)async{

try{
  
final response=await http.post(Uri.parse("${baseurl}/add_personal_details",),body:{
    "loan_case_id":"${SharedPreferencesService.getInt("enquireid")??1}",

    "co_fname": "${personalDetailmodel.coFname}",
    "co_lname": "${personalDetailmodel.coLname}",
    "co_phone": "${personalDetailmodel.coPhone}",
    "co_cibil": "${personalDetailmodel.coCibil}",
    "ca_bank_name_1":  "${personalDetailmodel.caBankName1}",
    "ca_bank_name_2":  "${personalDetailmodel.caBankName2}",
    "sa_credit_card_turnover_1":  "${personalDetailmodel.saCreditCardTurnover1}",
    "sa_credit_card_turnover_2":  "${personalDetailmodel.saCreditCardTurnover2}",
    "sa_bank_name_1":  "${personalDetailmodel.saBankName1}",
    "sa_bank_name_2":  "${personalDetailmodel.saBankName2}",
    "notes":  "${personalDetailmodel.note}",
    "itr_1":  "${personalDetailmodel.itr1}",
    "itr_2": "${personalDetailmodel.itr1}",
    "itr_3":  "${personalDetailmodel.itr1}",
    "next_appointment_date":  "${personalDetailmodel.nextAppointmentDate}",

    "other_loan":  "${personalDetailmodel.otherLoan}",
    "provide_solution": "${personalDetailmodel.provideSolution}",
    "live_emi_amount": "${personalDetailmodel.liveEmiAmount}",
    "latest_funding":  "${personalDetailmodel.latestFunding}",
    "live_loan_rtr": "${personalDetailmodel.liveLoanRtr}",
    "applicant_type_id":  "${personalDetailmodel.applicantTypeId}",
    "cc_od":  "${personalDetailmodel.ccOd}",
    "max_dpd":  "${personalDetailmodel.maxDpd}",
    "data_source":  "${personalDetailmodel.dataSource}",
    "loan_purpose":  "${personalDetailmodel.loanPurpose}",
    "note": "${personalDetailmodel.note}",
    "rejection_reason": "${personalDetailmodel.rejectionReason}",
    "bpl_no": "${personalDetailmodel.bplNo}",
    "hl_no": "${personalDetailmodel.hlNo}",
    "closer_date": "${personalDetailmodel.closerDate}"
});
print(response.body);
return response.body;

}catch (e){
  Get.snackbar("Message", e.toString());
  return e.toString();
}



}


static Future<PersonalDetialsModel> fetchPersonalDetials()async{
PersonalDetialsModel personalDetialsModel=PersonalDetialsModel();

try{
  
  final response=await http.post(Uri.parse("${baseurl}/fetch_personal_details"),body: 
{
    "loan_case_id":"${SharedPreferencesService.getInt("enquireid")??1}",


}
  );

print(response.body);
  personalDetialsModel=PersonalDetialsModel.fromJson(jsonDecode(response.body));
return personalDetialsModel;
}catch (e){
  Get.snackbar("Message", e.toString());
return personalDetialsModel;
}
}

static Future<List<ContacTypeModel>> getContactDropdoen() async{


List<ContacTypeModel> contacTypeModel=[];
  try{
    final response=await http.get(Uri.parse("${baseurl}/fetch_contact_type"));
    print(response.body);

for(Map<String,dynamic>i in jsonDecode(response.body)){   
  contacTypeModel.add(ContacTypeModel.fromJson(i));
}
return contacTypeModel;
  }
  catch (e){
    Get.snackbar("Message", e.toString());
return contacTypeModel;
  }
}




static Future<void> addContactApplicationDetails(Map<String,dynamic> data) async{

print(jsonEncode(data));

  try{
    final response=await http.post(Uri.parse("${baseurl}/add_loan_case_contact"),body: data);
    print(response.body);



  }
  catch (e){
    Get.snackbar("Message", e.toString());

  }
}


static Future<void> updateAnswerQuestion(int questionId ,String selectedOption,int typeid) async{


  try{
    final response=await http.post(Uri.parse("${baseurl}/add_user_ans"),body:{
    "loan_case_id": "${SharedPreferencesService.getInt("enquireid")}",
    "question_id": "${questionId}",
    "question_type_id": "${typeid}",
    "answer": "${selectedOption}",
    "updated_by": "${SharedPreferencesService.getInt("user_id")}"
});
    print(response.body);

print({
    "loan_case_id": "${SharedPreferencesService.getInt("enquireid")}",
    "question_id": "${questionId}",
    "question_type_id": "${typeid}",
    "answer": "${selectedOption}",
    "updated_by": "${SharedPreferencesService.getInt("user_id")}"
});

  }
  catch (e){
    Get.snackbar("Message", e.toString());

  }
}

static Future<void> addDataofENquireDetails(Map<String,dynamic> data) async{

print(jsonEncode(data));

  try{
    final response=await http.post(Uri.parse("${baseurl}/add_basic_enquiry"),body: data);
    print(response.body);



  }
  catch (e){
    Get.snackbar("Message", e.toString());

  }
}



static Future<List<ContactDetailsApplicant>> fetchContactApplicationDetails() async{

List<ContactDetailsApplicant> contactDetiasl=[];

  try{
    final response=await http.post(Uri.parse("${baseurl}/fetch_loan_case_contact"),body: {
      "loan_case_id":"${SharedPreferencesService.getInt("enquireid")??1}",

});
    print(response.body);
    for(Map<String,dynamic> i  in jsonDecode(response.body)){
contactDetiasl.add(ContactDetailsApplicant.fromJson(i));
    }
    return contactDetiasl;
  }
  catch (e){
    Get.snackbar("Message", e.toString());
        return contactDetiasl;

  }
}
static Future<List<RTRModel>> fetchRtrDetailsList() async{

List<RTRModel> rtrDetails=[];

  try{
    final response=await http.post(Uri.parse("${baseurl}/fetch_rtr"),body: {
   "loan_case_id":"${SharedPreferencesService.getInt("enquireid")??1}",

}
);
    print(response.body);
    for(Map<String,dynamic> i  in jsonDecode(response.body)){
rtrDetails.add(RTRModel.fromJson(i));
    }
    return rtrDetails;
  }
  catch (e){
    Get.snackbar("Message", e.toString());
        return rtrDetails;
  }
}




static Future<void> addRtrApplicationdetiasl(Map<String,dynamic> data) async{

print(jsonEncode(data));

  try{
    final response=await http.post(Uri.parse("${baseurl}/add_rtr"),body: data);
    print(response.body);


 Get.snackbar("Message", jsonDecode(response.body)["message"]);

  }
  catch (e){
    Get.snackbar("Message", e.toString());

  }
}


static Future<void> addItrDetails(Map<String,dynamic> data) async{

print(jsonEncode(data));

  try{
    final response=await http.post(Uri.parse("${baseurl}/add_itr"),body: data);
    print(response.body);


 Get.snackbar("Message", jsonDecode(response.body)["message"]);

  }
  catch (e){
    Get.snackbar("Message", e.toString());

  }
}

static Future<void> addabbDetails(Map<String,dynamic> data) async{

print(jsonEncode(data));

  try{
    final response=await http.post(Uri.parse("${baseurl}/add_abb_details"),body: data);
    print(response.body);


 Get.snackbar("Message", jsonDecode(response.body)["message"]);

  }
  catch (e){
    Get.snackbar("Message", e.toString());

  }
}


static Future<List<Abb_Model>> fetchAbbdetiasl() async{


List<Abb_Model> model=[];
  try{
    final response=await http.post(Uri.parse("${baseurl}/fetch_abb_details"),body:{
     "loan_case_id":"${SharedPreferencesService.getInt("enquireid")??1}",

   
});
    print(response.body);

for(Map<String,dynamic> i in jsonDecode(response.body)){
  model.add(Abb_Model.fromJson(i));
}

return model;

  }
  catch (e){
    Get.snackbar("Message", e.toString());
return model;
  }
}






static Future<String> updateProfilePicture(File _imageFile, int documentID) async {
  var formData = http.MultipartRequest('POST', Uri.parse('${baseurl}/add_loan_case_doc'));

  formData.fields.addAll({
    "loan_case_id": "${SharedPreferencesService.getInt("enquireid") ?? 1}",
    "account_id": "${SharedPreferencesService.getInt("account_id") ?? 1}",
    "doc_id": "$documentID",
    "created_by": "${SharedPreferencesService.getInt("user_id")}",
  });

  formData.files.add(await http.MultipartFile.fromPath(
    'file[0]',
    _imageFile.path,
  ));

  var response = await formData.send();

  // Await the response string
  String responseString = await response.stream.bytesToString();
  print('Response status: ${response.statusCode}');
  print('Response headers: ${response.headers}');
  print('Response body: $responseString');

  // Check for successful status code and return the response string
  if (response.statusCode == 200) {
    return responseString;
  } else {
    throw Exception('Failed to update profile picture. Status code: ${response.statusCode}');
  }
}



static Future<void> deleteData(int id)async{

final response=await http.post(Uri.parse("${baseurl}/delete_rtr"),body: { "rtr_id":"${id}"});
print(response.body);
  Get.snackbar("Message", response.body);
}

static Future<void> deleteContactData(int id)async{

final response=await http.post(Uri.parse("${baseurl}/delete_contact"),body: {
    "contact_id":"${id}",  
});
print(response.body);
  Get.snackbar("Message", response.body);
}






static Future<List<Dahboard_Data>> fetchDashbordData()async{


List<Dahboard_Data> data_dashbors=[];
final response=await http.post(Uri.parse("${baseurl}/dashboard"),body:{
    "account_id": SharedPreferencesService.getInt("account_id")??"1",
    "role_id":SharedPreferencesService.getInt("role_id")??"1",
    "user_id":SharedPreferencesService.getInt("user_id")??"6",
    
} );

for (Map<String,dynamic> i in jsonDecode(response.body)) {
  data_dashbors.add(Dahboard_Data.fromJson(i));
}
print(response.body);
  Get.snackbar("Message", response.body);
  return data_dashbors;
}

static Future<Itr_Model> fetchItrDetiaslyear_1(int year)async{

Itr_Model itr=Itr_Model();
final response=await http.post(Uri.parse("${baseurl}/fetch_itr_year"),body:{
    "loan_case_id": "${SharedPreferencesService.getInt("enquireid")}",
     "year":"${year}"
});

print(response.body);
  itr=Itr_Model.fromJson(jsonDecode(response.body));
print(response.body);
  Get.snackbar("Message", response.body);
  return itr;
}









}