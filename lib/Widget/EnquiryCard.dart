import 'package:dynamic_multi_step_form/dynamic_json_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:loanmanagement/Screens/LoancaseScreens/loancase.dart';
import 'package:loanmanagement/Services/LocalData.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class EnquireCard extends StatelessWidget {
   EnquireCard({super.key,required this.name,required this.discription,required this.loanamount,required this.loantype,required this.phoneno,required this.date,required this.enquiryStatusId,required this.enquireid,required this.email,required this.whatsapp_no,required this.color});
  final String name,discription,loantype,loanamount,phoneno,date,email;
  final int enquiryStatusId,enquireid,whatsapp_no;
  Color color;
SharedPreferencesService sharedPreferencesService=SharedPreferencesService();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      color: color,
      child: Container(
    
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                 
                  Text("${name}",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500 ),)
                ],
              ),
    
                   SizedBox(height: 7,),
              Row(
                children: [
               
                  Expanded(child: Text("Date: ${date}",style: TextStyle(fontSize:14 ),maxLines: 5,)),
                  Container(
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.shade100,
                      borderRadius: BorderRadius.circular(12)),
                    child: Center(child: Text(" ${loantype.trimRight()}",style: TextStyle(fontSize:14,color:Colors.white))))
                ],
              ),
              Row(
                children: [
               
                  Expanded(child: Text("Requested Amount: ${loanamount}",style: TextStyle(fontSize:14 ),maxLines: 5,)),
                ],
              ),
               SizedBox(height: 7,),
              Row(
                children: [
              

                      Visibility(
                        visible: true,
                        child:  GestureDetector(
                        onTap: (){

                                var dailnumber="tel:${phoneno}";
                  launchUrl(Uri.parse(dailnumber),
                  mode: LaunchMode.externalApplication
                  );


                        },
                        child: Icon(Icons.phone_outlined,color: Colors.blue,)),),


                        SizedBox(width: 10,),
                  Expanded(child: Text("${phoneno}",style: TextStyle(fontSize:16,fontWeight: FontWeight.w500),maxLines: 5,)),

                   GestureDetector(
                        onTap: (){

                           var androidUrl = "whatsapp://send?phone=+91${whatsapp_no}&text=Hi";
                   launchUrl(Uri.parse(androidUrl),
                   mode: LaunchMode.externalApplication
                   );

                        },
                        child: Image.asset("assets/whatsapp.png",height: 25,),),

                        SizedBox(width: 20,),
                    
                      GestureDetector(
                        onTap: (){

                 
                    launchUrl(Uri.parse('mailto:${email}'),
                    mode: LaunchMode.externalApplication
                    );

                        },
                        child: Icon(Icons.mail_outline,color: Colors.redAccent,)),
                        SizedBox(width: 20,),


                          Visibility(
                            visible: (enquiryStatusId==19),
                            child: GestureDetector(
                                                    onTap: (){
                                                          SharedPreferencesService.setInt("enquireid", enquireid);
                                                          print("***********************");
                                                          print(SharedPreferencesService.getInt("enquireid"));
                                                          print("***********************");
                                                          Get.to(LoanCaseForm(),transition: Transition.rightToLeft);
                                                    },
                                                    child: Icon(Icons.verified,color: Colors.blue,size: 30,)),
                          ),
                              SizedBox(width: 20,),
                 
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}