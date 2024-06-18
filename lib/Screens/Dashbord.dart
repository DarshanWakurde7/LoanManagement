// enquiry_dashboard.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:loanmanagement/Controller/EnquireListController.dart';
import 'package:loanmanagement/Screens/AddEnquire.dart';
import 'package:loanmanagement/Screens/LoancaseScreens/LoanCaseDetailsScreen.dart';
import 'package:loanmanagement/Screens/LoancaseScreens/loancase.dart';
import 'package:loanmanagement/Services/LocalData.dart';
import 'package:loanmanagement/Widget/DropdoewnDesign.dart';
import 'package:loanmanagement/Widget/EnquiryCard.dart';
import 'package:get/get.dart';
import 'package:loanmanagement/Widget/textfield.dart';

class EnquiryDashBoard extends StatelessWidget {
  EnquiryDashBoard({super.key});
  final EnquireConroller enquireConroller = Get.put(EnquireConroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
//         width: double.infinity,
//         backgroundColor: Colors.white,
//         child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 50,),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: GestureDetector(
//                       onTap: (){
//                         Navigator.pop(context);
//                       },
//                       child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,)),
//                   )
//               ],
//             ),
//             SizedBox(height: 18,),
//  Row(
//   mainAxisAlignment: MainAxisAlignment.spaceAround,
//   crossAxisAlignment: CrossAxisAlignment.end,
//    children: [
//      CircleAvatar(
//           radius: 30,
//           backgroundImage:NetworkImage("https://i.sstatic.net/ZZ7VK.png",scale: 0.1),
//          ),
       
//                     SizedBox(height: 20,width: 10,),
               
//                    Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                      children: [
//                        Text(SharedPreferencesService.getString("name")??"ken",style:const  TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black)),
//                        Text(SharedPreferencesService.getString("email")??"portalwiechn@gmail.com",style:const  TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Colors.black)),
//                      ],
//                    ),

                   
//                     SizedBox(width:20,),
//    ],
//  ),
            
//   SizedBox(height: 80,),
//   Padding(
//     padding: const EdgeInsets.symmetric(horizontal:  20.0,vertical: 13),
//     child: Row(
//       children: [
//         Icon(Icons.home,size: 22,color: Colors.black,),
//         SizedBox(width: 10,),
//          Text("Dashboard",style:const  TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black))
//       ],
//     ),
//   ),
//   Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 13),
//     child: Row(
//       children: [
//         Icon(Icons.question_answer_outlined,size: 22,color: Colors.black,),
//          SizedBox(width: 10,),
//          Text("Enquirys",style:const  TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black))
//       ],
//     ),
//   ),
//   Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 13),
//     child: GestureDetector(
//       onTap: () {
//         Navigator.pop(context);
//         Get.to(AddEnquire(),transition: Transition.rightToLeft);
//       },
//       child: Row(
//         children: [
//           Icon(Icons.question_mark_sharp,size: 22,color: Colors.black,),
//            SizedBox(width: 10,),
//            Text("Add Enquiry",style:const  TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black))
//         ],
//       ),
//     ),
//   ),
//   Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 13),
//     child: GestureDetector(
//       onTap: ()=>Get.to(LoanCaseForm(),transition: Transition.rightToLeft),
//       child: Row(
//         children: [
//           Icon(Icons.question_answer,size: 22,color: Colors.black,),
//            SizedBox(width: 10,),
//            Text("Loan Case",style:const  TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black))
//         ],
//       ),
//     ),
//   ),

//   Align(
//     alignment: Alignment.bottomCenter,
//     child: Container(
//       width: double.infinity,
//       height: 100,
//       child: Center(child: Text("Version 1.1.0")),),
//   )


//           ],
//         ),
//       ),
      appBar: AppBar(
       centerTitle: true,
        backgroundColor: Colors.grey.shade100,
        title: Text("Loan Management System",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade100,
          child: Padding(
            padding:  EdgeInsets.zero,
            child: Column(
            
              children: [
            
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 18),
                      Container(
                        decoration: BoxDecoration(color: Colors.green.shade300,borderRadius: BorderRadius.circular(25)),
                        height: 30,
                        width: 55,
                        child: Center(child: Text("All")),
                      ),
                      SizedBox(width: 13,),
                      Container(
                        decoration: BoxDecoration(color: Colors.green.shade300,borderRadius: BorderRadius.circular(25)),
                        height: 30,
                        width: 80,
                        child: Center(child: Text("Enquiry")),
                      ),
                      SizedBox(width: 13,),
                      Container(
                        decoration: BoxDecoration(color: Colors.green.shade300,borderRadius: BorderRadius.circular(25)),
                        height: 30,
                        width: 85,
                        child: Center(child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text("Loan Case"),
                        )),
                      ),
                              
                              
                    ],),
                     SizedBox(width: 70),
                          GestureDetector(
                            onTap: () {
        
        
        
                               showDialog(context: context, builder: (context){
                                return SingleChildScrollView(
                                  child: Dialog(
                                  
                                    surfaceTintColor: Colors.white,
                                    backgroundColor: Colors.white,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 5),
                                      height: 660,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                        
                                            SizedBox(height:10),
                                                                    
                                                Padding(
                                                  padding: const EdgeInsets.all(15.0),
                                                  child: Text("Personal Information",style: TextStyle(fontSize: 19.5,fontWeight: FontWeight.w500),),
                                                ),
                                  
                                                TextfiledWidget(fieldName: "First Name", textcontroller:enquireConroller.fname.value , onChangedData: (val){
                                                  enquireConroller.setfname(val);
                                                }, inputType: TextInputType.text),
                                                      SizedBox(height: 3,),
                                                TextfiledWidget(fieldName: "Last Name", textcontroller:enquireConroller.lname.value , onChangedData: (val){
                                                  enquireConroller.setlname(val);
                                                }, inputType: TextInputType.text),
                                                      SizedBox(height: 3,),
                                                TextfiledWidget(fieldName: "Requested Loan amount", textcontroller:enquireConroller.requested_loan_amount.value , onChangedData: (val){
                                                  enquireConroller.setrequestedloanamount(val);
                                                }, inputType: TextInputType.number),
                                              SizedBox(height: 3,),
                                               DropdownUni(fieldName: "Loan Type", textcontroller:enquireConroller.enqtype.value , onChangedData: (val){
                                                            (enquireConroller.dropdownmodel.value.loanType??[]).forEach((element) {
                                                              if (element.loanType==val) {
                                                                enquireConroller.setenquireData(val, element.loanTypeId??0);
                                                              }
                                                             });
                                        
                                               }, listdata:(enquireConroller.dropdownmodel.value.loanType??[]).map((e){
                                                return DropdownMenuEntry(value: e.loanType, label: e.loanType??"");
                                               }).toList() ),
                                              SizedBox(height: 3,),
                                                TextfiledWidget(fieldName: "Mail", textcontroller:enquireConroller.mail.value , onChangedData: (val){
                                                 enquireConroller.setMail(val);
                                                }, inputType: TextInputType.text),
                                                      SizedBox(height: 3,),
                                                TextfiledWidget(fieldName: "Phone", textcontroller:enquireConroller.phone.value , onChangedData: (val){
                                                  enquireConroller.setPhone(val);
                                                }, inputType: TextInputType.number),
                                                      SizedBox(height: 3,),
                                                TextfiledWidget(fieldName: "Whatsapp", textcontroller:enquireConroller.whatsapp_no.value , onChangedData: (val){
                                                  enquireConroller.setWhatsappno(val);
                                                }, inputType: TextInputType.number),
                                                SizedBox(height: 20,),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      ElevatedButton(
                                                        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green.shade300)),
                                                        onPressed: (){
                                                        enquireConroller.addEnqireData();
                                                        enquireConroller.getAllEnquireData();
                                                        Navigator.pop(context);
                                                
                                                        }, child: Text("Save Data",style: TextStyle(color: Colors.white),))
                                                    ],
                                                  ),
                                                )
                                          ]
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                          });
                              
                            },
                            child: Container(
                              
                                              decoration: BoxDecoration(color: Colors.green.shade300,borderRadius: BorderRadius.circular(25)),
                                              height: 30,
                                              width: 30,
                                              child: Center(child: Icon(Icons.add)),
                                            ),
                          ),
                  SizedBox(width: 3),
                  ],
                ),
                SizedBox(height: 20,),
                Obx(() {
                  if (enquireConroller.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    print(enquireConroller.enquiremodel.length);
                    return Container(
                   
                   decoration: BoxDecoration(
                  color: Colors.white,
                       borderRadius: BorderRadius.only(topLeft: Radius.circular(22),topRight: Radius.circular(22))
                   ),
                      height: MediaQuery.of(context).size.height*0.805,
                      child: RefreshIndicator(
                        onRefresh: ()async{
                         await enquireConroller.getAllEnquireData();
                        },
                        child: ListView.builder(
                          padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
                          itemCount: enquireConroller.enquiremodel.length,
                          itemBuilder: (context, ind) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(5,10,5,0),
                              child: GestureDetector(
                                onTap: (){
                                  Get.to(LoanCaseDetails(enquiryModel: enquireConroller.enquiremodel[ind],));
          
                                },
                                child: EnquireCard(name: ("${enquireConroller.enquiremodel[ind].fname??""} ${enquireConroller.enquiremodel[ind].lname??""}"),discription: enquireConroller.enquiremodel[ind].enqDetailMsg??'',loanamount: "${enquireConroller.enquiremodel[ind].requestedLoanAmount??00}",loantype: enquireConroller.enquiremodel[ind].loantypeString??"",phoneno: "${enquireConroller.enquiremodel[ind].phone??0}",date: "${enquireConroller.enquiremodel[ind].enquiryDate??""}",enquiryStatusId: enquireConroller.enquiremodel[ind].enquiryStatusId??0,enquireid: enquireConroller.enquiremodel[ind].loanCaseId??0,email: enquireConroller.enquiremodel[ind].email??"lms",whatsapp_no: enquireConroller.enquiremodel[ind].whatsappNo??000,color: Colors.grey.shade100,)),
                            );
                          },
                        ),
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
