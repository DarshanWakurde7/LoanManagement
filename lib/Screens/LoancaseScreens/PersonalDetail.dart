import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:loanmanagement/Controller/loancase/PersonalInfoController.dart';
import 'package:loanmanagement/Controller/loancase/personalDetail.dart';
import 'package:loanmanagement/Widget/DateTextField.dart';
import 'package:loanmanagement/Widget/DropdoewnDesign.dart';
import 'package:loanmanagement/Widget/ElevatedButton.dart';
import 'package:loanmanagement/Widget/textarea.dart';
import 'package:loanmanagement/Widget/textfield.dart';

class PersonalDetail extends StatelessWidget {
   PersonalDetail({super.key});

  PersonalDetialController personalDetialController=Get.put(PersonalDetialController());

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          
          borderRadius: BorderRadius.horizontal(left: Radius.circular(12),right: Radius.circular(12))),
        child: Column(
            children: [


SizedBox(height: 10,),
Container(
  margin: EdgeInsets.only(top: 6),
  height: MediaQuery.of(context).size.height*0.04,
  child: ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemCount: 5,
    itemBuilder: (context,indx){
    return Obx(
      () {
        return GestureDetector(
          onTap: (){
            personalDetialController.setCurrentInd(indx);
          },
          child: Container(
            margin: EdgeInsets.all(3),
            width: 80,
              height: MediaQuery.of(context).size.height*0.02,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: (indx==personalDetialController.currentind.value)?Colors.green.shade500:Colors.green.shade200,
          ),
            child: Center(child: Text("${indx+1}"))),
        );
      }
    );
  }),
),


          Container(height: MediaQuery.of(context).size.height*0.735,color: Colors.white,
          child: Obx((){
      switch (personalDetialController.currentind.value) {
      case 0:
        return PersonalDetial1();
      case 1:
        return PersonalDetal3();
      case 2:
        return PersonalDetails4();
      case 3:
        return PersonalDetail2() ;
      case 4:
        return PersonalDetail5();
      default:
        return Container();
    }
          }),
          
          )
           
            ],
          ),
      ),
    );
  }
}


class PersonalDetial1 extends StatelessWidget {
   PersonalDetial1({super.key});
PersonalDetialController _personalDetialController=Get.put(PersonalDetialController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

              SizedBox(height: 10,),
              TextfiledWidget(fieldName: "Data Source", textcontroller: _personalDetialController.datasource.value, onChangedData: (val){
                    _personalDetialController.setdataSource(val);
              }, inputType: TextInputType.text),
              SizedBox(height: 5,),
              TextfiledWidget(fieldName: "Purpose ", textcontroller: _personalDetialController.purpose.value, onChangedData: (val){
                    _personalDetialController.setPurpose(val);
              }, inputType: TextInputType.text),
              SizedBox(height: 5,),
              TextfiledWidget(fieldName: "Number of Home Loans", textcontroller: _personalDetialController.homeloannum.value, onChangedData: (val){
                    _personalDetialController.sethomeloanno(val);
              }, inputType: TextInputType.number),
              SizedBox(height: 5,),
       TextfiledWidget(fieldName: "Bpl live loan", textcontroller: _personalDetialController.bplnum.value, onChangedData: (val){
        _personalDetialController.setbplno(val);
       }, inputType: TextInputType.number),
              SizedBox(height: 5,),
      TextfiledWidget(fieldName: "Max DPD", textcontroller: _personalDetialController.maxdpd.value, onChangedData: (val){
        _personalDetialController.setMaxDpd(val);
       }, inputType: TextInputType.number),
              SizedBox(height: 5,),

                 Textarea(fieldName: "Rejection Reason", textcontroller: _personalDetialController.rejectionreason.value, onChangedData: (val){
        _personalDetialController.setRejectionReason(val);
       }, inputType: TextInputType.text),
     
 
              SizedBox(height: 5,),

              SizedBox(height: 8,),
           MyElevatedbutton(text: "Next", onPressed: (){
print("okk");
   })
            
      ],
    );
  }
}


class PersonalDetail2 extends StatelessWidget {
   PersonalDetail2({super.key});
PersonalDetialController _personalDetialController=Get.put(PersonalDetialController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(height: 10,),
              TextfiledWidget(fieldName: "Co Fname", textcontroller: _personalDetialController.cofname.value, onChangedData: (val){
                    _personalDetialController.setcoFname(val);
              }, inputType: TextInputType.text),
              SizedBox(height: 5,),
              TextfiledWidget(fieldName: "Co Lname", textcontroller: _personalDetialController.colname.value, onChangedData: (val){
                    _personalDetialController.setcoClname(val);
              }, inputType: TextInputType.text),
              SizedBox(height: 5,),
              TextfiledWidget(fieldName: "Co Phone", textcontroller: _personalDetialController.cophone.value, onChangedData: (val){
                    _personalDetialController.setcophone(val);
              }, inputType: TextInputType.number),
              SizedBox(height: 5,),
       TextfiledWidget(fieldName: "Co Cibil Score", textcontroller: _personalDetialController.coCilbil.value, onChangedData: (val){
        _personalDetialController.setcocibil(val);
       }, inputType: TextInputType.number),
              SizedBox(height: 5,),
      TextfiledWidget(fieldName: "Current Account Bank1", textcontroller: _personalDetialController.cobank1.value, onChangedData: (val){
        _personalDetialController.setcoBank1(val);
       }, inputType: TextInputType.text),
              SizedBox(height: 5,),
              TextfiledWidget(fieldName: "Current Account Bank2", textcontroller: _personalDetialController.cobank2.value, onChangedData: (val){
                    _personalDetialController.setcoBank2(val);
              }, inputType: TextInputType.text),
              SizedBox(height: 5,),

         
  SizedBox(height: 10,),
                 MyElevatedbutton(text: "Next", onPressed: (){

   })

      ],
    );
  }
}


class PersonalDetal3 extends StatelessWidget {
   PersonalDetal3({super.key});

  PersonalDetialController _personalDetialController=Get.put(PersonalDetialController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [


        SizedBox(height: 10,),
   TextfiledWidget(fieldName: "Saving Account Credit Turnover 1", textcontroller: _personalDetialController.sacrediturn1.value, onChangedData: (val){
        _personalDetialController.setsacreditturn1(val);
       }, inputType: TextInputType.number),
       
        SizedBox(height: 5,),
   TextfiledWidget(fieldName: "Saving Account Credit Turnover 2", textcontroller: _personalDetialController.sacrediturn2.value, onChangedData: (val){
        _personalDetialController.setsacreditturn2(val);
       }, inputType: TextInputType.number),
        SizedBox(height: 5,),
   TextfiledWidget(fieldName: "Saving Account Bank 1", textcontroller: _personalDetialController.sabank1.value, onChangedData: (val){
        _personalDetialController.setsabank1(val);
       }, inputType: TextInputType.text),
        SizedBox(height: 5,),
   TextfiledWidget(fieldName: "Saving Account Bank 2", textcontroller: _personalDetialController.sabank2.value, onChangedData: (val){
        _personalDetialController.setsabank2(val);
       }, inputType: TextInputType.text),
                    SizedBox(height: 5,),
              TextfiledWidget(fieldName: "cc/od", textcontroller: _personalDetialController.ccod.value, onChangedData: (val){
                    _personalDetialController.setCCod(val);
              }, inputType: TextInputType.number),
        SizedBox(height: 5,),

       Textarea(fieldName: "Notes", textcontroller: _personalDetialController.notes.value, onChangedData: (val){
            _personalDetialController.setNotes(val);
       }, inputType: TextInputType.text),
        SizedBox(height: 15,),

    MyElevatedbutton(text: "Next", onPressed: (){

   })



      ],
    );
  }
}


class PersonalDetails4 extends StatelessWidget {
   PersonalDetails4({super.key});
  PersonalDetialController _personalDetialController=Get.put(PersonalDetialController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [


        SizedBox(height: 10,),
 
        SizedBox(height: 5,),
   TextfiledWidget(fieldName: "Number Live EMIs", textcontroller: _personalDetialController.liveEmi.value, onChangedData: (val){
        _personalDetialController.setLiveEmi(val);
       }, inputType: TextInputType.number),
        SizedBox(height: 5,),
   TextfiledWidget(fieldName: "Live RTR", textcontroller: _personalDetialController.livertr.value, onChangedData: (val){
        _personalDetialController.setLiveRtr(val);
       }, inputType: TextInputType.number),
        SizedBox(height: 5,),
   TextfiledWidget(fieldName: "Latest Funding", textcontroller: _personalDetialController.latestfunding.value, onChangedData: (val){
        _personalDetialController.setlatestfunding(val);
       }, inputType: TextInputType.number),
        SizedBox(height: 5,),
                DropdownUni(fieldName: "Applicant Type", textcontroller: _personalDetialController.applicationType.value, onChangedData: (val){
               ( _personalDetialController.dropdownmodel.value.applicantType??[]).forEach((element) {
                if(element.applicantType==val){
                  _personalDetialController.setApplicanttype(val, element.applicantTypeId??0);
                }
                });
              }, listdata:( _personalDetialController.dropdownmodel.value.applicantType??[]).map((e){
                return DropdownMenuEntry(value: e.applicantTypeId, label: e.applicantType??"");
              }).toList()),
        
        SizedBox(height: 5,),

       Textarea(fieldName: "Provide Solution", textcontroller: _personalDetialController.providesolution.value, onChangedData: (val){
            _personalDetialController.setprovidesolution(val);
       }, inputType: TextInputType.text),
        SizedBox(height: 15,),

   MyElevatedbutton(text: "Next", onPressed: (){

   })



      ],
    );
  }
}

class PersonalDetail5 extends StatelessWidget {
   PersonalDetail5({super.key});

   PersonalDetialController _personalDetialController=Get.put(PersonalDetialController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [


        SizedBox(height: 10,),
   TextfiledWidget(fieldName: "ITR 1", textcontroller: _personalDetialController.itr1.value, onChangedData: (val){
        _personalDetialController.setitr1(val);
       }, inputType: TextInputType.number),
        SizedBox(height: 5,),
   TextfiledWidget(fieldName: "ITR 2", textcontroller: _personalDetialController.itr2.value, onChangedData: (val){
        _personalDetialController.setitr2(val);
       }, inputType: TextInputType.number),
        SizedBox(height: 5,),
   TextfiledWidget(fieldName: "ITR 3", textcontroller: _personalDetialController.itr3.value, onChangedData: (val){
        _personalDetialController.setitr3(val);
       }, inputType: TextInputType.number),
        SizedBox(height: 5,),
   DateTimeTextfiledWidget(fieldName: "Next Appointment", textcontroller: _personalDetialController.nextappointmentdate.value, onChangedData: (val){
        _personalDetialController.setnextappointmentDate(val);
       }, inputType: TextInputType.text),
        SizedBox(height: 5,),
   DateTimeTextfiledWidget(fieldName: "Closer Date", textcontroller: _personalDetialController.estimateClousoredate.value, onChangedData: (val){
        _personalDetialController.setEstimateClousoreDate(val);
       }, inputType: TextInputType.text),
        SizedBox(height: 5,),

       TextfiledWidget(fieldName: "Other loan", textcontroller: _personalDetialController.otherloan.value, onChangedData: (val){
            _personalDetialController.setOtherloan(val);
       }, inputType: TextInputType.number),
        SizedBox(height: 15,),

ElevatedButton(onPressed: ()=>_personalDetialController.savePersonalDetails(), child: Text("Save"))



      ],
    );
  }
}