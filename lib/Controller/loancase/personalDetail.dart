import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanmanagement/Apicalls/LoanApis.dart';
import 'package:loanmanagement/Models/DropdownModel.dart';
import 'package:loanmanagement/Models/loancaseModels/PersonalDetial.dart';
import 'package:loanmanagement/Screens/LoancaseScreens/PersonalDetail.dart';
import 'package:loanmanagement/Services/LocalData.dart';

class PersonalDetialController extends GetxController{
var currentind=0.obs;

var dropdownmodel = DropdownModel(paymentStatus: [],creditManager: [],salesManager: [],leadLevel: []).obs;

var personaldetial=PersonalDetialsModel().obs;
var isBlankdata=true.obs();
var datasource=TextEditingController().obs;
var paymentStatus=TextEditingController().obs;
var nextappointmentdate=TextEditingController().obs;
var estimateClousoredate=TextEditingController().obs;
var enqMessageData=TextEditingController().obs;
var leadlevel=TextEditingController().obs;
var notes=TextEditingController().obs;
var rejectionreason=TextEditingController().obs;
var clousareDate=TextEditingController().obs;
var leadlevelid=0.obs;
var otherloan=TextEditingController().obs;
var providesolution=TextEditingController().obs;
var liveEmi=TextEditingController().obs;
var livertr=TextEditingController().obs;
var passduedate=TextEditingController().obs;
var purpose=TextEditingController().obs;
var homeloannum=TextEditingController().obs;
var bplnum=TextEditingController().obs;
var maxdpd=TextEditingController().obs;
var itr1=TextEditingController().obs;
var itr2=TextEditingController().obs;
var itr3=TextEditingController().obs;
var latestfunding=TextEditingController().obs;
var sacrediturn1=TextEditingController().obs;
var sacrediturn2=TextEditingController().obs;
var ccod=TextEditingController().obs;
var sabank1=TextEditingController().obs;
var sabank2=TextEditingController().obs;
var cofname=TextEditingController().obs;
var colname=TextEditingController().obs;
var cophone=TextEditingController().obs;
var coCilbil=TextEditingController().obs;
var cobank1=TextEditingController().obs;
var cobank2=TextEditingController().obs;
var applicationType=TextEditingController().obs;
var applicationid=0.obs;







  void onInit() {
 super.onInit();
 fetchPersonalDetials();
getAlldropDownData();

  }


  Future<void> savePersonalDetails()async{


        PersonalDetialsModel personalDetail=PersonalDetialsModel(
          loanCaseId:SharedPreferencesService.getInt("enquireid"),
          coFname: cofname.value.text,
          coLname: colname.value.text,
          coCibil: int.parse(coCilbil.value.text),
          coPhone: int.parse(cophone.value.text),
          dataSource: datasource.value.text,
          loanPurpose: purpose.value.text,
          hlNo: int.parse(homeloannum.value.text),
          bplNo: int.parse(bplnum.value.text),
          maxDpd:int.parse( maxdpd.value.text),
          rejectionReason: rejectionreason.value.text,
          saCreditCardTurnover1: int.parse(sacrediturn1.value.text),
          saCreditCardTurnover2: int.parse(sacrediturn2.value.text),
          saBankName1: sabank1.value.text,
          saBankName2: sabank2.value.text,
         pastDueDate:  passduedate.value.text,
         note: notes.value.text,
         liveLoanRtr: int.parse(livertr.value.text),
         latestFunding: int.parse(latestfunding.value.text),
         applicantTypeId: applicationid.value,
         otherLoan: int.parse(otherloan.value.text),
         liveEmiAmount: int.parse(liveEmi.value.text),
        provideSolution: providesolution.value.text,
        caBankName1: cobank1.value.text,
        caBankName2: cobank2.value.text,
      ccOd: int.parse(ccod.value.text),
      itr1: int.parse(itr1.value.text),
      itr2: int.parse(itr2.value.text),
      itr3: int.parse(itr3.value.text),
     nextAppointmentDate: nextappointmentdate.value.text,
    closerDate: estimateClousoredate.value.text,
    
        );
        String data=await APiClls.addPersonalDetials(personalDetail);
         Get.snackbar("Message", "${data}");  
  }


  Future<void> fetchPersonalDetials()async{

   personaldetial.value =   await APiClls.fetchPersonalDetials();

   setdataSource(personaldetial.value.coFname??"");
   setPurpose(personaldetial.value.loanPurpose??"");
   sethomeloanno((personaldetial.value.hlNo??0).toString());
   setbplno((personaldetial.value.bplNo??0).toString());
   setMaxDpd((personaldetial.value.maxDpd??0).toString());
    setRejectionReason((personaldetial.value.rejectionReason??0).toString());
    setsacreditturn1((personaldetial.value.rejectionReason??0).toString());
    setsacreditturn2((personaldetial.value.saCreditCardTurnover2??0).toString());
    setsabank1(personaldetial.value.saBankName1??"");
    setsabank2(personaldetial.value.saBankName2??"");
    setCCod((personaldetial.value.ccOd??00).toString());
    setNotes(personaldetial.value.note??"");
    setLiveEmi((personaldetial.value.liveEmiAmount??0).toString());
    setLiveRtr((personaldetial.value.liveLoanRtr??0).toString());
    setlatestfunding((personaldetial.value.latestFunding??0).toString());
    // setApplicanttype((personaldetial.value.applicantTypeI??0).toString());
    setprovidesolution(personaldetial.value.provideSolution??"");
    setcoFname(personaldetial.value.coFname??"");
    setcoClname(personaldetial.value.coLname??"");
    setcophone((personaldetial.value.coPhone??0000000000).toString());
    setcocibil((personaldetial.value.coCibil??00).toString());
    setcoBank1((personaldetial.value.caBankName1??00).toString());
    setcoBank2((personaldetial.value.caBankName2??00).toString());
    setitr1(personaldetial.value.caBankName1??"");
    setitr2(personaldetial.value.caBankName2??"");
    setitr3(personaldetial.value.caBankName2??"");
    setnextappointmentDate(personaldetial.value.caBankName2??"");
    setEstimateClousoreDate(personaldetial.value.caBankName2??"");
    setOtherloan((personaldetial.value.otherLoan??0).toString());

  

  }




Future<void> getAlldropDownData() async {
    print("Fetching dropdown data...");

    dropdownmodel.value = await APiClls.getAllDerpdownData();
    if ((dropdownmodel.value.paymentStatus??[]).isNotEmpty) {
      // paymentstatus.value = (dropdownmodel.value.paymentStatus??[]).first.paymentStatus??""; // Set default value
      // loantype.value.text = (dropdownmodel.value.loanType??[]).first.loanType??""; // Set default value
      // enquirystatus.value = (dropdownmodel.value.enquiryStatus??[]).first.enquiryStatus??""; // Set default value
      //  applicant_type.value = (dropdownmodel.value.applicantType??[]).first.applicantType??""; // Set default value
       leadlevel.value.text = (dropdownmodel.value.leadLevel??[]).first.leadLevel??""; // Set default value
      //  salesManager.value.text = (dropdownmodel.value.salesManager??[]).first.fullName??""; // Set default value

    } else {
    
      print("No payment status data available.");
    }
    print(dropdownmodel.value.leadLevel!.length);
  }


 setCurrentInd(int index){
  currentind(index);
}

setdataSource(String data){
  datasource.value.text=data;
}
setpaymentStatus(String data){
  paymentStatus.value.text=data;
}
setnextappointmentDate(String data){
  nextappointmentdate.value.text=data;
}
setlatestfunding(String data){
  latestfunding.value.text=data;
}
setLiveRtr(String data){
  livertr.value.text=data;
}
setLiveEmi(String data){
  liveEmi.value.text=data;
}
setenqMessageData(String data){
  enqMessageData.value.text=data;
}
setEstimateClousoreDate(String date){
  estimateClousoredate.value.text=date;
}
setNotes(String notesdata){
  notes.value.text=notesdata;
}
setRejectionReason(String notesdata){
  rejectionreason.value.text=notesdata;
}

setcoFname(String name){
  cofname.value.text=name;
}
setcoClname(String lname){
  colname.value.text=lname;
}
setphoneno(String phoneno){
  cophone.value.text=phoneno;
}
setcocibil(String cibil){
  coCilbil.value.text=cibil;
}
setcoBank1(String bank1){
  cobank1.value.text=bank1;
}
setcoBank2(String bank2){
  cobank2.value.text=bank2;
}
setcophone(String phone){
  cophone.value.text=phone;
}
setsacreditturn1(String phone){
  sacrediturn1.value.text=phone;
}
setsacreditturn2(String phone){
  sacrediturn2.value.text=phone;
}
setsabank1(String phone){
  sabank1.value.text=phone;
}
setsabank2(String phone){
  sabank2.value.text=phone;
}
setitr1(String itr){
  itr1.value.text=itr;
}
setitr2(String itr){
  itr2.value.text=itr;
}
setitr3(String itr){
  itr3.value.text=itr;
}
setPurpose(String itr){
  purpose.value.text=itr;
}
sethomeloanno(String itr){
  homeloannum.value.text=itr;
}
setbplno(String itr){
  bplnum.value.text=itr;
}
setOtherloan(String value){
  otherloan.value.text=value;
}
setprovidesolution(String value){
  providesolution.value.text=value;
}
setMaxDpd(String value){
  maxdpd.value.text=value;
}
setPassduedate(String value){
  passduedate.value.text=value;
}
setCCod(String value){
  ccod.value.text=value;
}
setleadlevelinfo(String leadleveldata,int id){
  leadlevel.value.text=leadleveldata;
  leadlevelid(id);
}
setApplicanttype(String leadleveldata,int id){
  applicationType.value.text=leadleveldata;
  applicationid(id);
}




}