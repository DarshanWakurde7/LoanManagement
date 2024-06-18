
import 'package:flutter/material.dart';
import 'package:loanmanagement/Screens/LoancaseScreens/CustomStepper.dart';

class LoanCaseForm extends StatefulWidget {
  @override
  _LoanCaseFormState createState() => _LoanCaseFormState();
}

class _LoanCaseFormState extends State<LoanCaseForm> {
  int _index=0;
  int upperbound=5;
    TextEditingController fname=TextEditingController();
  TextEditingController lname=TextEditingController();
  TextEditingController phone=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Container(
             color: Colors.grey.shade200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 60,),
        
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text("Application Credit",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                ),
                SizedBox(height: 20,),
                Container(
                
                  height: MediaQuery.of(context).size.height*0.87,
                  child: CustomStepper()),
              ],
            ),
          ),
        ),
      )
          
         
               
     
    );
  }

  
}