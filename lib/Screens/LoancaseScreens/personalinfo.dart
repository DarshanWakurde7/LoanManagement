import 'package:dynamic_multi_step_form/dynamic_json_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanmanagement/Controller/loancase/PersonalInfoController.dart';
import 'package:loanmanagement/Widget/DateTextField.dart';
import 'package:loanmanagement/Widget/DropdoewnDesign.dart';
import 'package:loanmanagement/Widget/textfield.dart';

class PersonalInfo extends StatefulWidget {
   PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
PersonalInfoCOntroller personalInfoCOntroller=Get.put(PersonalInfoCOntroller());


@override
  void initState() {
    // TODO: implement initState
    personalInfoCOntroller.getDataofPersonalInfo();
    super.initState();
  }

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
            personalInfoCOntroller.setCurrentindex(indx);
          },
          child: Container(
            margin: EdgeInsets.all(3),
            width: 80,
              height: MediaQuery.of(context).size.height*0.02,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: (indx==personalInfoCOntroller.currentind.value)?Colors.green.shade500:Colors.green.shade200,
          ),
            child: Center(child: Text("${indx+1}"))),
        );
      }
    );
  }),
),


          Container(height: MediaQuery.of(context).size.height*0.735,color: Colors.white,
          child: Obx((){
      switch (personalInfoCOntroller.currentind.value) {
      case 0:
        return PersonalInfo1();
      case 1:
        return PersonalInfo2();
      case 2:
        return PersonalInfo3();
      case 3:
        return PersonalInfo4();
      case 4:
        return PersonalInfo5();
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

class PersonalInfo1 extends StatelessWidget {
   PersonalInfo1({super.key});

PersonalInfoCOntroller personalInfoCOntroller=Get.put(PersonalInfoCOntroller());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Column(
          children: [
            
        
        SizedBox(height: 10,),
                TextfiledWidget(fieldName: "First Name",textcontroller: personalInfoCOntroller.fname.value,onChangedData: (val){
                  print(val);
                },inputType: TextInputType.name,
                
                ),
                      SizedBox(height: 5,),
                TextfiledWidget(fieldName: "Last Name",textcontroller: personalInfoCOntroller.lname.value,onChangedData: (val){
                  print(val);
                },inputType: TextInputType.name,),
                      SizedBox(height: 5,),
                TextfiledWidget(fieldName: "Phoneno",textcontroller: personalInfoCOntroller.phone.value,onChangedData: (val){
                  print(val);
                },inputType: TextInputType.phone,),
                      SizedBox(height: 5,),
                TextfiledWidget(fieldName: "Alternate Contact",textcontroller: personalInfoCOntroller.whatsapp_no.value,onChangedData: (val){
                  print(val);
                },inputType: TextInputType.phone,),
                      SizedBox(height: 5,),
                TextfiledWidget(fieldName: "Email",textcontroller: personalInfoCOntroller.email.value,onChangedData: (val){
                  print(val);
                },inputType: TextInputType.emailAddress,),
        
             
                           SizedBox(height: 5,),
              DateTimeTextfiledWidget(fieldName: "Birth Date", textcontroller: personalInfoCOntroller.birthdate.value, onChangedData: (value){
                  personalInfoCOntroller.setBirthDate(value);
              }, inputType: TextInputType.datetime),
     
            
                      SizedBox(height: 5,),
                                       
           DropdownUni(fieldName: "Gender", textcontroller: personalInfoCOntroller.gender.value, onChangedData: (value){
          personalInfoCOntroller.setGender(value);
        }, listdata: (["male","female","other"]).map((e){
          return DropdownMenuEntry(value: e, label:e);
        }).toList()),
                      


                  SizedBox(height: 10),
                     ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white)),
                      minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width*0.8, 40)),
                      surfaceTintColor: MaterialStatePropertyAll(Colors.black)),
                      
                      
                      
                    onPressed: () {
                  
                    },
                    child: Text('Next',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),),
                  ),
          ],
        );
      }
    );
  }
}
class PersonalInfo2 extends StatelessWidget {
   PersonalInfo2({super.key});

PersonalInfoCOntroller personalInfoCOntroller=Get.put(PersonalInfoCOntroller());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Column(
       
          children: [


                    
        SizedBox(height: 8,),
        // SizedBox(height: 5,),



             
                    TextfiledWidget(fieldName: "Mother Name",textcontroller: personalInfoCOntroller.mothername.value,onChangedData: (val){
                  print(val);
                },inputType: TextInputType.name,
                
                ),
                  SizedBox(height: 2.5,),
                             TextfiledWidget(fieldName: "Pin",textcontroller: personalInfoCOntroller.pin.value,onChangedData: (val){
               
                },inputType: TextInputType.number,
                
                ),
         SizedBox(height: 2.5,),
       
  
             
          DropdownUni(fieldName: "State", textcontroller: personalInfoCOntroller.state.value, onChangedData: (value){

              (personalInfoCOntroller.dropdownmodel.value.state??[]).forEach((element) {
               if(element.stateName==value){

                  // print(element.stateId);
                personalInfoCOntroller.setStateInfo(value,element.stateId??0);
                print(personalInfoCOntroller.stateid.value);
               }
              });
          personalInfoCOntroller.getpersonalInfocityDrop(personalInfoCOntroller.stateid.value);  
              print(personalInfoCOntroller.stateid.value);
        }, listdata: (personalInfoCOntroller.dropdownmodel.value.state??[]).map((e){
          return DropdownMenuEntry(value: e.stateName, label:"${e.stateName}");
        }).toList()),
             
                  SizedBox(height: 2.5),
                 
                  DropdownUni(fieldName: "City", textcontroller: personalInfoCOntroller.city.value, onChangedData: (value){

           personalInfoCOntroller.citydroplist.value.forEach((element) {
            if(value==element.cityName){
             personalInfoCOntroller.setCityInfo(value,element.cityId??0);
            }
            });

   
                
        }, listdata: (personalInfoCOntroller.citydroplist.value??[]).map((e){
          return DropdownMenuEntry(value: e.cityName, label:"${e.cityName}");
        }).toList()),
          
           
                        SizedBox(height: 2.5,),
                TextfiledWidget(fieldName: "Pernament Address",textcontroller: personalInfoCOntroller.address.value,onChangedData: (val){
                personalInfoCOntroller.setaddress(val);
                },inputType: TextInputType.streetAddress,),
                      SizedBox(height: 5,),
                TextfiledWidget(fieldName: "Residential Address",textcontroller: personalInfoCOntroller.resdentailaddress.value,onChangedData: (val){
                  personalInfoCOntroller.setResidentialAddewss(val);
                },inputType: TextInputType.streetAddress,),

     
                  SizedBox(height: 2.5),
               DropdownUni(fieldName: "Credit Manager ", textcontroller: personalInfoCOntroller.creditManager.value, onChangedData: (val){
              (personalInfoCOntroller.dropdownmodel.value.creditManager??[]).forEach((element) {
                if(element.fullName==val){
                  personalInfoCOntroller.setCreditManagerInfo(val, element.userId??0);
                  } 
                  });
               }, listdata: (personalInfoCOntroller.dropdownmodel.value.creditManager??[]).map((e){
                return DropdownMenuEntry(value: e.fullName, label: e.fullName??"");
               }).toList()),
             
         
                  SizedBox(height: 10),
                     ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white)),
                      minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width*0.8, 40)),
                      surfaceTintColor: MaterialStatePropertyAll(Colors.black)),
                    onPressed: () {
                  
                    },
                    child: Text('Next',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),),
                  ),
          ],
        );
      }
    );
  }
}



class PersonalInfo3 extends StatelessWidget {
   PersonalInfo3({super.key});

PersonalInfoCOntroller personalInfoCOntroller=Get.put(PersonalInfoCOntroller());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Column(
       
          children: [
            
        

          

        SizedBox(height: 10,),

                 TextfiledWidget(fieldName: "Office Location",textcontroller: personalInfoCOntroller.officelocation.value,onChangedData: (val){
                 personalInfoCOntroller.setofficelocation(val);
                },inputType: TextInputType.name,
                
                ),
  SizedBox(height: 5,),
           DropdownUni(fieldName: "Loan Type", textcontroller: personalInfoCOntroller.loantype.value, onChangedData: (value){
                   (personalInfoCOntroller.dropdownmodel.value.loanType??[]).forEach((element) {
               if(element.loanType==value){

                  // print(element.stateId);
                 personalInfoCOntroller.setLoantypeValue(value,element.loanTypeId??0);
                print(personalInfoCOntroller.loantype.value);
               }
              });
        
        }, listdata: (personalInfoCOntroller.dropdownmodel.value.loanType??[]).map((e){
          return DropdownMenuEntry(value: e.loanTypeId, label: e.loanType??"");
        }).toList()),
             
            SizedBox(height: 5,),
                 TextfiledWidget(fieldName: "Pan no",textcontroller: personalInfoCOntroller.pan.value,onChangedData: (val){
                  print(val);
                },inputType: TextInputType.streetAddress,),
            SizedBox(height: 5,),
                TextfiledWidget(fieldName: "Required Loan Amount",textcontroller: personalInfoCOntroller.requiredLoanAmount.value,onChangedData: (val){
                  personalInfoCOntroller.setrequiredLoanAmount(val);
                },inputType: TextInputType.name,),
            SizedBox(height: 5,),
                TextfiledWidget(fieldName: "Credit Turnover",textcontroller: personalInfoCOntroller.creditTurnover.value,onChangedData: (val){
                  print(val);
                },inputType: TextInputType.name,),
       
              SizedBox(height: 5,),
              DateTimeTextfiledWidget(fieldName: "Case Date", textcontroller: personalInfoCOntroller.loancasedate.value, onChangedData: (value){
                  personalInfoCOntroller.setloancasedate(value);
              }, inputType: TextInputType.datetime),
          
              SizedBox(height: 5,),
                 TextfiledWidget(fieldName: "Cibil Score",textcontroller: personalInfoCOntroller.cibilScore.value,onChangedData: (val){
                  print(val);
                },inputType: TextInputType.number,
                
                ),
        SizedBox(height: 5,),
        // DropdownUni(fieldName: "Enquiry Mode", textcontroller: personalInfoCOntroller.enquiremode.value, onChangedData: (value){
        //   personalInfoCOntroller.setLoantypeValue(value);
        // }, listdata:(personalInfoCOntroller.dropdownmodel.value.enquiryMode??[]).map((e){
        //   return DropdownMenuEntry(value: e.enquiryModeId, label: e.enquiryMode??"");
        // }).toList()),
         
                  SizedBox(height: 5),
                     ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white)),
                      minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width*0.8, 40)),
                      surfaceTintColor: MaterialStatePropertyAll(Colors.black)),
                    onPressed: () {
                  
                    },
                    child: Text('Next',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),),
                  ),
          ],
        );
      }
    );
  }
}
class PersonalInfo4 extends StatelessWidget {
   PersonalInfo4({super.key});

PersonalInfoCOntroller personalInfoCOntroller=Get.put(PersonalInfoCOntroller());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Column(
       
          children: [
            

          

        SizedBox(height: 8,),

           DropdownUni(fieldName: "Sales Manager", textcontroller: personalInfoCOntroller.salesManager.value, onChangedData: (value){

           ( personalInfoCOntroller.dropdownmodel.value.salesManager??[]).forEach((element) {
              if(value==element.fullName){
                personalInfoCOntroller.setSalesManager(value, element.userId??0);
              }
            });
      
        }, listdata: (personalInfoCOntroller.dropdownmodel.value.salesManager??[]).map((e){
          return DropdownMenuEntry(value: e.userId, label: e.fullName??"");
        }).toList()),
             
            SizedBox(height: 4,),
                        DropdownUni(fieldName: "Partner Name", textcontroller: personalInfoCOntroller.partnerName.value, onChangedData: (value){
          personalInfoCOntroller.setpartnerName(value);
        }, listdata: (personalInfoCOntroller.dropdownmodel.value.partnerList??[]).map((e){
          return DropdownMenuEntry(value: e.userId, label: e.fullName??"");
        }).toList()),
            SizedBox(height: 3,),
                        DropdownUni(fieldName: "Commercial office", textcontroller: personalInfoCOntroller.commeritialOffice.value, onChangedData: (value){
          personalInfoCOntroller.setcommertialoffice(value);
        }, listdata: (["Owned","Rented","Na"]).map((e){
          return DropdownMenuEntry(value: e, label: e);
        }).toList()),
            SizedBox(height: 3,),
                        DropdownUni(fieldName: "Residential office", textcontroller: personalInfoCOntroller.residentialOffice.value, onChangedData: (value){
          personalInfoCOntroller.setresidentialoffice(value);
        }, listdata: (["Owned","Rented","Na"]).map((e){
          return DropdownMenuEntry(value: e, label: e);
        }).toList()),
               SizedBox(height: 3,),
                 TextfiledWidget(fieldName: "Bussiness Name",textcontroller: personalInfoCOntroller.company.value,onChangedData: (val){
                 personalInfoCOntroller.setcompanyname(val);
                },inputType: TextInputType.text,
                
                ),
                       SizedBox(height: 3,),
                 TextfiledWidget(fieldName: "Bussiness Profile",textcontroller: personalInfoCOntroller.bussinessprofile.value,onChangedData: (val){
                  personalInfoCOntroller.setbussinessprofile(val);
                },inputType: TextInputType.text,
                
                ),
                               SizedBox(height: 3,),
                 TextfiledWidget(fieldName: "Live Loan",textcontroller: personalInfoCOntroller.liveLoan.value,onChangedData: (val){
                  personalInfoCOntroller.setliveloan(val);
                },inputType: TextInputType.text,
                
                ),
            
        
         
                  SizedBox(height: 2),
                     ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white)),
                      minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width*0.8, 40)),
                      surfaceTintColor: MaterialStatePropertyAll(Colors.black)),
                    onPressed: () {
                  
                    },
                    child: Text('Next',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),),
                  ),
          ],
        );
      }
    );
  }
}
class PersonalInfo5 extends StatelessWidget {
   PersonalInfo5({super.key});

PersonalInfoCOntroller personalInfoCOntroller=Get.put(PersonalInfoCOntroller());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Column(
       
          children: [
            
        

          

        SizedBox(height: 10,),

         
      

         
                             DropdownUni(fieldName: "Alredy Applied", textcontroller: personalInfoCOntroller.already_applied.value, onChangedData: (value){
          personalInfoCOntroller.setalredyapplied(value);
        }, 
        listdata: (["yes","No"]).map((e){
          return DropdownMenuEntry(value: e, label: e);
        }).toList()),
        
        SizedBox(height: 5,),

         
               TextfiledWidget(fieldName: "Dist Location",textcontroller: personalInfoCOntroller.distlocation.value,onChangedData: (val){
               personalInfoCOntroller.setdislocation(val);
                },inputType: TextInputType.streetAddress,
                
                ),
        SizedBox(height: 5,),

         
                          DropdownUni(fieldName: "Office Residential Ownership", textcontroller: personalInfoCOntroller.residentialOffice.value, onChangedData: (value){
          personalInfoCOntroller.setresidentialoffice(value);
        }, listdata: (["Owned","Rented","Na"]).map((e){
          return DropdownMenuEntry(value: e, label: e);
        }).toList()),
                               DropdownUni(fieldName: "Office Current Ownership", textcontroller: personalInfoCOntroller.officeCurrentOwner.value, onChangedData: (value){
          personalInfoCOntroller.setofficecurrowner(value);
        }, listdata: (["Owned","Rented","Na"]).map((e){
          return DropdownMenuEntry(value: e, label: e);
        }).toList()),
                                 DropdownUni(fieldName: "Home Residential Ownership", textcontroller: personalInfoCOntroller.homeRentOwner.value, onChangedData: (value){
          personalInfoCOntroller.sethomewresidentowner(value);
        }, listdata: (["Owned","Rented","Na"]).map((e){
          return DropdownMenuEntry(value: e, label: e);
        }).toList()),
                               DropdownUni(fieldName: "Home Current Ownership", textcontroller: personalInfoCOntroller.homeCurrentOwner.value, onChangedData: (value){
          personalInfoCOntroller.setHomeCurrOwner(value);
        }, listdata: (["Owned","Rented","Na"]).map((e){
          return DropdownMenuEntry(value: e, label: e);
        }).toList()),
                  SizedBox(height: 10),
                     ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white)),
                      minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width*0.8, 40)),
                      surfaceTintColor: MaterialStatePropertyAll(Colors.black)),
                    onPressed: () async{
                    await  personalInfoCOntroller.fireApicall();
                    }
                    ,
                    child: Text('Save',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),),
                  ),
          ],
        );
      }
    );
  }
}