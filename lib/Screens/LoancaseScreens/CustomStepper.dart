
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanmanagement/Controller/loancase/ApplicationDetailsController.dart';
import 'package:loanmanagement/Controller/loancase/abbdetails/abbdetails.dart';
import 'package:loanmanagement/Models/loancaseModels/AbbModel.dart';
import 'package:loanmanagement/Screens/LoancaseScreens/ApplicationDetail.dart';
import 'package:loanmanagement/Screens/LoancaseScreens/PersonalDetail.dart';
import 'package:loanmanagement/Screens/LoancaseScreens/Questionlist.dart';
import 'package:loanmanagement/Screens/LoancaseScreens/personalinfo.dart';
import 'package:loanmanagement/Screens/LoancaseScreens/uploadDocuments.dart';

class CustomStepper extends StatefulWidget {
  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int _currentStep = 0;
  List<bool> _formCompleted = [false, false, false,false,false];
  List<String> Detail = ["Information","Detail","Application Details","Question List","Upload Document"];
ApplicationController applicationController =Get.put(ApplicationController());
abbdetailsController abbcontroller =Get.put(abbdetailsController());
  @override
  Widget build(BuildContext context) {
    return Container(
    color: Colors.grey.shade200,
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) => _buildStep(index,)),
                ),
                
              ],
            ),
          ),
          SizedBox(height: 15,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
              ),
              
              child: _buildForm()),
          ),
        ],
      ),
    );
  }
   Widget _buildStep(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentStep = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Text(Detail[index],style: TextStyle(fontWeight: FontWeight.w500),),
            //  Text("${index+1}",style: TextStyle(fontWeight: FontWeight.w500),),
             SizedBox(height: 10,),
            Container(
              width: 140,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: _formCompleted[index]
                    ? Colors.green
                    : (_currentStep == index ? Colors.green.shade300 : Colors.grey.shade300),
              ),
            ),
                 SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    switch (_currentStep) {
      case 0:
        return PersonalInfo();
      case 1:
        return PersonalDetail();
      case 2:
        return RefreshIndicator(
          onRefresh: ()=>fetchinfo(),
          child: ApplicationDetail());
      case 3:
        return QuestionStateless();
      case 4:
        return DocumentsList();
      default:
        return Container();
    }

}


Future<void> fetchinfo()async{
  applicationController.fetchRtrList();
  applicationController.FetchAllContacts();
abbcontroller.fetchAbb();
}

}