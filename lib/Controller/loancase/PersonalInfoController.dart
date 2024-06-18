import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:loanmanagement/Apicalls/LoanApis.dart';
import 'package:loanmanagement/Models/AddEnquireModel.dart';
import 'package:loanmanagement/Models/CityDropdownModel.dart';
import 'package:loanmanagement/Models/DropdownModel.dart';
import 'package:loanmanagement/Models/loancaseModels/PersonalinforModel.dart';
import 'package:loanmanagement/Services/LocalData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalInfoCOntroller extends GetxController{





  void onInit()async {
 super.onInit();

  await getAlldropDownData();
 getDataofPersonalInfo();

  }



  var isBlank = false.obs;

  var citydroplist=<CityDropdownModel>[].obs;
  var dropdownmodel = DropdownModel(paymentStatus: [],creditManager: [],salesManager: [],leadLevel: []).obs;
  var fname=TextEditingController().obs;
  var lname=TextEditingController().obs;
  var phone=TextEditingController().obs;
  var whatsapp_no=TextEditingController().obs;
  var email=TextEditingController().obs;
  var distlocation=TextEditingController().obs;
  var state=TextEditingController().obs;
  var city=TextEditingController().obs;
  var pin=TextEditingController().obs;
  var company=TextEditingController().obs;
  var creditManager=TextEditingController().obs;
  var address=TextEditingController().obs;
  var resdentailaddress=TextEditingController().obs;
  var pan=TextEditingController().obs;
  var birthdate=TextEditingController().obs;
  var officelocation=TextEditingController().obs;
  var enquiredate=TextEditingController().obs;
  var datasource=TextEditingController().obs;
  var mothername=TextEditingController().obs;
  var enquiremode=TextEditingController().obs;
  var loancasedate=TextEditingController().obs;
  var cibilScore=TextEditingController().obs;
  var gender=TextEditingController().obs;
  var creditTurnover=TextEditingController().obs;
  var salesManager=TextEditingController().obs;
  var partnerName=TextEditingController().obs;
  var requiredLoanAmount=TextEditingController().obs;
  var residentialOffice=TextEditingController().obs;
  var commeritialOffice=TextEditingController().obs;
  var bussinessprofile=TextEditingController().obs;
  var already_applied=TextEditingController().obs;
  var officeRentOwner =TextEditingController().obs;
  var officeCurrentOwner=TextEditingController().obs;
  var homeCurrentOwner=TextEditingController().obs;
  var homeRentOwner=TextEditingController().obs;
  var bussinessname=TextEditingController().obs;
  var loantype = TextEditingController().obs; // Default value
  var liveLoan = TextEditingController().obs; // Default value
  var stateid=0.obs;
  var cityid=0.obs;
  var salesid=0.obs;
  var loantypeId=0.obs;
  var currentind=0.obs;
  var genderid=4.obs;
  var creditmanagerId=0.obs;
  var homecurrentownerid=0.obs;
  var homerentid=0.obs;
  var officerentid=0.obs;
  var officecurrentid=0.obs;
  var personalInfo=PersonalInformation().obs;

Future<void> getDataofPersonalInfo()async{

  await personalInfo(await APiClls.fetchPersonalInfodetail());

  SharedPreferencesService.setInt("LoanCase_id",SharedPreferencesService.getInt("enquireid")??0);
  setfname(personalInfo.value.fname??"fname");
  setLname(personalInfo.value.lname??"lname");
  setphone(personalInfo.value.phone.toString()??"phone");
  setwhatsappNo(personalInfo.value.whatsappNo.toString()??"whatssapp");
  setEmail(personalInfo.value.email??"Email");
  setBirthDate(personalInfo.value.dateOfBirth??"00/00/00");
   setgenderInfo((personalInfo.value.gender==0)?"Male":(personalInfo.value.gender==1)?"Female":"other", personalInfo.value.gender??0);
  setmothername(personalInfo.value.motherName??"mothername");
getStateformid(personalInfo.value.state??0);
 setaddress(personalInfo.value.permanentAddress??"");
 setpin(personalInfo.value.pin.toString()??"0");
 setResidentialAddewss(personalInfo.value.currentAddress??"");
 getCreditManager(personalInfo.value.creditManager??0);
 setofficelocation(personalInfo.value.officeAddress??"location");
 setrequiredLoanAmount((personalInfo.value.requestedLoanAmount??0).toString());
setloancasedate(personalInfo.value.caseDate??"");
setCibil(personalInfo.value.cibilScore??"00");
getSalesManager(personalInfo.value.salesManager??0);
getPartnerName(personalInfo.value.partnerId??0);
setPanno(personalInfo.value.panNumber??"ahlp");
setliveloan(personalInfo.value.liveLoan??"liveloan");
 setdislocation(personalInfo.value.distLocation??"dist");
setCreditturnover(personalInfo.value.creditturnover??"000");
setbussinessprofile(personalInfo.value.bussinessProfile??"bussiness profile");
setBussinessName(personalInfo.value.businessName??"");
setofficecurrowner((personalInfo.value.commercialOfficeOwnership=="0")?"Na":(personalInfo.value.commercialOfficeOwnership=="1")?"Owned":"Rented");
setofficerentowner((personalInfo.value.commercialOfficeOwnership=="0")?"Na":(personalInfo.value.commercialOfficeOwnership=="1")?"Owned":"Rented");
sethomewresidentowner((personalInfo.value.commercialOfficeOwnership=="0")?"Na":(personalInfo.value.commercialOfficeOwnership=="1")?"Owned":"Rented");
setHomeCurrOwner((personalInfo.value.commercialOfficeOwnership=="0")?"Na":(personalInfo.value.commercialOfficeOwnership=="1")?"Owned":"Rented");
setalredyapplied((personalInfo.value.alreadyApplied==0)?"yes":"No");
}


 getStateformid(int id){
  getpersonalInfocityDrop(id);
(dropdownmodel.value.state??[]).forEach((element) {
  if(id==element.stateId){
setStateInfo(element.stateName??"okk", id);
print(element.stateName);
  }
 });

 

}




getSalesManager(int id){

  (dropdownmodel.value.salesManager??[]).forEach((element) { 

      if(element.userId==id){

        print(element.fullName);
        setSalesManager(element.fullName??"name",id);

      }


  });


}
getPartnerName(int id){

  (dropdownmodel.value.partnerList??[]).forEach((element) { 

      if(element.userId==id){

        print(element.fullName);
        print("****45***");
        setpartnerName(element.fullName??"name");
        print("****45***");

      }


  });


}


getCreditManager(int id){

  (dropdownmodel.value.creditManager??[]).forEach((element) { 

      if(element.userId==id){

        setCreditManagerInfo(element.fullName??"name",id);
 
      }


  });


}


 getcityfromid(int id,int stateid){


citydroplist.value.forEach((element) {
  if(element.cityId==id){

    print(element.cityName);

  }


});



}





void setCurrentindex(int value){
  currentind(value);
}

  Future<void> getAlldropDownData() async {
    print("Fetching dropdown data...");
    isBlank(true);
    dropdownmodel.value = await APiClls.getAllDerpdownData();
    if ((dropdownmodel.value.paymentStatus??[]).isNotEmpty) {
      // paymentstatus.value = (dropdownmodel.value.paymentStatus??[]).first.paymentStatus??""; // Set default value
      loantype.value.text = (dropdownmodel.value.loanType??[]).first.loanType??""; // Set default value
      // enquirystatus.value = (dropdownmodel.value.enquiryStatus??[]).first.enquiryStatus??""; // Set default value
      //  applicant_type.value = (dropdownmodel.value.applicantType??[]).first.applicantType??""; // Set default value
      //  leadlevel.value = (dropdownmodel.value.leadLevel??[]).first.leadLevel??""; // Set default value
       salesManager.value.text = (dropdownmodel.value.salesManager??[]).first.fullName??""; // Set default value
      isBlank(false);
    } else {
      isBlank(false);
      print("No payment status data available.");
    }
  }


  Future<void> getpersonalInfocityDrop(int id)async{
    citydroplist.clear();
      citydroplist.addAll(await APiClls.getCityDropdown(id));
    await citydroplist;
  
  }

  Future<void> fireApicall()async{
  
PersonalInformation personalnformation=PersonalInformation(    
                                                    fname: fname.value.text,
                                                    lname: lname.value.text,
                                                    creditManager: creditmanagerId.value,
                                                    phone: int.parse(phone.value.text),
                                                    whatsappNo: int.parse(whatsapp_no.value.text),
                                                    email: email.value.text,
                                                    accountId: SharedPreferencesService.getInt("account_id"),
                                                    createdBy: SharedPreferencesService.getInt("user_id")??0,
                                                    dateOfBirth: birthdate.value.text,
                                                    gender:genderid.value,
                                                    motherName: mothername.value.text,
                                                    pin:pin.value.text,
                                                    state: stateid.value,
                                                    city: cityid.value,
                                                    currentAddress: address.value.text,
                                                    permanentAddress: resdentailaddress.value.text,
                                                    officeAddress: officelocation.value.text,
                                                    loanType: loantypeId.value,
                                                    panNumber: pan.value.text,
                                                    requestedLoanAmount: int.parse(requiredLoanAmount.value.text),
                                                  caseDate: enquiredate.value.text,
                                                  cibilScore: cibilScore.value.text,
                                                  salesManager: salesid.value,
                                                  businessName: company.value.text,
                                                  // buss: bussinessprofile.value.text,
                                                  alreadyApplied: already_applied.value.text,
                                                  distLocation: distlocation.value.text,
                                                  residentialOfficeOwnership:officerentid.value,
                                                  commercialOfficeOwnership: officecurrentid.value,
                                                  residentialHomeOwnership: homerentid.value,
                                                  permanentHomeOwnership: homecurrentownerid.value,
                                                  liveLoan: liveLoan.value.text,
                                                  );


      await APiClls.addLoanCasePersonalInformaition(personalnformation);

  }





  setfname(String value){
    fname.value.text=value;
  }
  setLname(String value){
    lname.value.text=value;
  }
  setwhatsappNo(String value){
    whatsapp_no.value.text=value;
  }
  setphone(String value){
    phone.value.text=value;
  }
  setEmail(String value){
    email.value.text=value;
  }
  setLoantypeValue(String value,int id){
    loantype.value.text=value;
    loantypeId(id);
  }
  setBirthDate(String value){
    birthdate.value.text=value;
  }
  setdislocation(String value){
    distlocation.value.text=value;
  }
  setloancasedate(String value){
    loancasedate.value.text=value;
  }
  setEniquiryDate(String value){
    birthdate.value.text=value;
  }
  setBussinessName(String value){
    bussinessname.value.text=value;
  }
  setmothername(String value){
    mothername.value.text=value;
  }
  setofficelocation(String value){
    officelocation.value.text=value;
  }
  setpin(String pincode){
pin.value.text=pincode;
  }
setCreditturnover(String CreditTurnover){
print(creditTurnover);  
creditTurnover.value.text=CreditTurnover;

}
  setCibil(String data){
    cibilScore.value.text=data;
  }
  setPanno(String panno){
    pan.value.text=panno;
  }

  
  setGender(String value){
    gender.value.text=value;
  }
  setResidentialAddewss(String value){
    resdentailaddress.value.text=value;
  }
  setaddress(String value){
    address.value.text=value;
  }
  setrequiredLoanAmount(String value){
    requiredLoanAmount.value.text=value;
  }
  setSalesManager(String value,int id){
    salesManager.value.text=value;
    
  }
  setpartnerName(String value){
    partnerName.value.text=value;
  }
  setresidentialoffice(String value){
    residentialOffice.value.text=value;
  }
  setcommertialoffice(String value){
    commeritialOffice.value.text=value;
  }
  setcompanyname(String value){
    company.value.text=value;
  }
  setbussinessprofile(String value){
    bussinessprofile.value.text=value;
  }
  setalredyapplied(String value){
    already_applied.value.text=value;
  }
  setofficerentowner(String value){
    officeRentOwner.value.text=value;
  }
  setofficecurrowner(String value){
    officeCurrentOwner.value.text=value;
  }
  sethomewresidentowner(String value){
    homeRentOwner.value.text=value;
  }
  setHomeCurrOwner(String value){
    homeCurrentOwner.value.text=value;
  }
  
  setliveloan(String value){
    liveLoan.value.text=value;
  }
  setStateInfo(String value,int id){
    state.value.text=value;
    stateid(id);
  }
  setCityInfo(String value,int id){
    city.value.text=value;
    stateid(id);
  }
  setCreditManagerInfo(String value,int id){
    creditManager.value.text=value;
    creditmanagerId(id);
  }
  setgenderInfo(String value,int id){
    gender.value.text=value;
    genderid(id);
  }
}