import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loanmanagement/Models/EnquiryData.dart';
import 'package:loanmanagement/Screens/LoancaseScreens/PersonalDetail.dart';
import 'package:loanmanagement/Widget/EnquiryCard.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class LoanCaseDetails extends StatelessWidget {
  const LoanCaseDetails({super.key,required this.enquiryModel});
final EnquiryModel enquiryModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 247, 247),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 248, 247, 247),
        title: Text("Application Credit Detials"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:Card(
                color: Colors.white,
                child: Container(
                decoration: BoxDecoration(  color: Colors.white,
                borderRadius: BorderRadius.circular(11)
                ),
                  child: Column(
                    children: [
                      SizedBox(height: 5,),
                   
                   
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,

                children: [
                   SizedBox(width: 32,),
                  Text("${enquiryModel.fname} ${enquiryModel.lname}",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500 ),),
                  
               
                ],
              ),
                       SizedBox(height: 5,),
                          Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                              
                                              children: [
                                               
                                                Text("Date: ",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500 ),),
                                                Text("${enquiryModel.dateOfBirth??"00-00-0000"}",style: TextStyle(fontSize:14,fontWeight: FontWeight.w400 ),)
                                              ],
                                            ),
                                                 Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.shade100,
                      borderRadius: BorderRadius.circular(12)),
                    child: Center(child: Padding(
                      padding: const EdgeInsets.symmetric(vertical:2),
                      child: Text(" ${enquiryModel.loantypeString}",style: TextStyle(fontSize:14,color:Colors.white)),
                    )))
                            ],
                          ),
                       SizedBox(height: 5,),
                          Row(
                children: [
                  SizedBox(width: 32,),
                            Row(
                children: [
                  
                  Text("State: ",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500 ),),
                  Text("${enquiryModel.state??"Maharashtra"}",style: TextStyle(fontSize:14,fontWeight: FontWeight.w400 ),)
                ],
              ),
                            Row(
                children: [
                  SizedBox(width: 60,),
                  Text("City: ",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500 ),),
                  Text("${enquiryModel.city??"Gangapur"}",style: TextStyle(fontSize:14,fontWeight: FontWeight.w400 ),)
                ],
              ),
                 
                ],
              ),

                SizedBox(height: 5,),

                       Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 32,),
                  Text("Address: ",style: TextStyle(fontSize:14,fontWeight: FontWeight.w500 ),),
                  Expanded(child: Text("${enquiryModel.address??"Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016"}",style: TextStyle(fontSize:14,fontWeight: FontWeight.w400 ),maxLines: 3,))
                ],
              ),
                    ],
                  ),
                ),
              )
            ),
         SizedBox(height: 10,),
        //  Padding(
        //    padding: const EdgeInsets.symmetric(horizontal: 10.0),
        //    child: Card(
        //    color: Colors.grey.shade100,
        //     margin: EdgeInsets.symmetric(horizontal: 5),
        //      child: ExpansionTile(title: Text(
        //       "Personal Details",
        //       style: TextStyle(fontSize: 16),
             
        //      ),children: [
        //       Padding(
        //         padding: EdgeInsets.symmetric(horizontal: 8),
        //         child: PersonalDetail())
        //      ],),
        //    ),
        //  ),
//  SizedBox(height: 10,),

Card(
  color: Colors.white,
  margin: EdgeInsets.symmetric(horizontal: 10),
  child: Container(
    
    height: 150,
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10,),
        Text("Application Details",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
        Container(
    color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 20),
          height: 70,
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
               SizedBox(width: 5,),
              Column(
                children: [
                                      Container(
                        height: 40,
                        width: 40,
                        
                  decoration: BoxDecoration(
                          color: Color.fromARGB(255, 155, 187, 243),
                    borderRadius: BorderRadius.circular(11)
                  ),
                        child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Image.asset("assets/profiles.png",width: 10,),
                  ),),
                        SizedBox(height: 8,),
                      Text("PD",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)
                ],
              ),
               SizedBox(width: 20,),
              Column(
                children: [
                                      Container(
                        height: 40,
                        width: 40,
                        
                  decoration: BoxDecoration(
                        color: Color.fromARGB(255, 155, 187, 243),
                    borderRadius: BorderRadius.circular(11)
                  ),
                       child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Image.asset("assets/contact.png",width: 10,),
                  ),),
                        SizedBox(height: 8,),
                      Text("Contacts",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),)
                ],
              ),
              SizedBox(width: 25,),
              Column(
                children: [
                      Container(
                        height: 40,
                        width: 40,
                        
                  decoration: BoxDecoration(
                  
                               color: Color.fromARGB(255, 155, 187, 243),
                    borderRadius: BorderRadius.circular(11),
                    
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Image.asset("assets/tax.png",width: 10,),
                  ),
                  
                       ),
                  SizedBox(height: 8,),
                      Text("ITR")
                ],
              ),
                 SizedBox(width: 30,),
              Column(
                children: [
                                       Container(
                        height: 40,
                        width: 40,
                        
                  decoration: BoxDecoration(
                          color: Colors.greenAccent.shade100,
                    borderRadius: BorderRadius.circular(11)
                  ),
                        child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Image.asset("assets/income.png",width: 10,),
                  ),
                        ),
                        SizedBox(height: 8,),
                      Text("RTR")
                ],
              ),
                 SizedBox(width: 30,),
              Column(
                children: [
                                          Container(
                        height: 40,
                        width: 40,
                        
                  decoration: BoxDecoration(
                          color: Colors.greenAccent.shade100,
                    borderRadius: BorderRadius.circular(11)
                  ),
                             child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Image.asset("assets/calculator.png",width: 10,),
                  ),),
                        SizedBox(height: 8,),
                      Text("ABB")
                ],
              ),
            ],
          ),
        )
      ],
    ),
    decoration: BoxDecoration(
  color: Colors.white,
      borderRadius: BorderRadius.circular(11)),
  
  ),
),
 SizedBox(height: 15,),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                
                decoration: BoxDecoration(
                        color: Colors.white,
                  borderRadius: BorderRadius.circular(11)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         
                          Text("Questions Analysis",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                          Text("${"View All->"}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.green,backgroundColor: Colors.greenAccent),),
                         
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SimpleCircularProgressBar(   
                              maxValue: 10,
                              progressStrokeWidth: 4,
                              backStrokeWidth: 4,
                              size: 50,
                          valueNotifier:ValueNotifier(6),
                          mergeMode: true,
                          onGetText: (double value) {
                              return Text(
                      '${value.toInt()}',
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                      ),
                              );
                          },
                      ),
                      
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      
                        Text("Total Question: ${9}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                        Text("Question Completed: ${5}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                      ],)
                      
                          ],
                        ),
                    ),
                    SizedBox(height: 5,)
                  ],
                ),
              ),
            ),
 SizedBox(height: 10,),
            Card(
               margin: EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                       
                decoration: BoxDecoration(
                        color: Colors.white,
                  borderRadius: BorderRadius.circular(11)
                ),
                child: Column(
                  children: [
                Padding(
               padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         
                          Text("Document Analysis",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                          Text("${"View All->"}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.green,backgroundColor: Colors.greenAccent),),
                         
                        ],
                      ),
                    ),
              
                    Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SimpleCircularProgressBar(   
                              maxValue: 10,
                              progressStrokeWidth: 4,
                              backStrokeWidth: 4,
                              size: 50,
                          valueNotifier:ValueNotifier(10),
                          mergeMode: true,
                          onGetText: (double value) {
                              return Text(
                      '${value.toInt()}',
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                      ),
                              );
                          },
                      ),
                    
                      
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      
                        Text("Total Documents: ${9}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                        Text("Documents Completed: ${5}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                      ],),
                      
                          ],
                        ), 
                    ),
                    SizedBox(height: 3,)
                  ],
                ),
              ),
            ),
          
          ],
        ),
      ),

    );
  }
}