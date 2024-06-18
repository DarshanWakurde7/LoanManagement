import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loanmanagement/Controller/loancase/QuistionController.dart';
import 'package:loanmanagement/Widget/ShortAnswer.dart';
import 'package:loanmanagement/Widget/Singlechoicemcq.dart';
import 'package:loanmanagement/Widget/checkboxquestion.dart';

class QuestionStateless extends StatelessWidget {
   QuestionStateless({super.key});

  QuestionController questionController=Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))
        ),
        child: Column(
          children: [
            SizedBox(height: 15,),
            Obx(
                 
              () {
              if (questionController.isLoading.value) {
                return Center(child: CircularProgressIndicator(color: Colors.green.shade400,),);
              }
              else{
                  return RefreshIndicator(
                    onRefresh: ()=>questionController.getApiCallFor(),
                    child: Container(
                     
                      height: MediaQuery.of(context).size.height*0.775,
                      child: ListView.builder(
                      
                          itemCount: questionController.questionData.length,
                          itemBuilder: (context, index) {
                          switch (questionController.questionData[index].questionType) {
                            case 1:
                         questionController.setheTextEdingController(index,questionController.selectedOptions[questionController.questionData[index].id]??"0",questionController.questionData[index].option??[]); 
                    
                              return  Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,0,20),
                                child: SingleChoice(Questiontext: questionController.questionData[index].questionText??"question", textEditingController: questionController.textEditingController[index], option:(questionController.questionData[index].option??[]).map((e) {return DropdownMenuEntry(value: Text(e.optionText??""), label: '${e.optionText}');}).toList() , onChangedData: (val){
                                  
                                  
                                  }),
                              );
                              
                            case 3:
                              return ShortAnswer(Questiontext: questionController.questionData[index].questionText??"",category: questionController.questionData[index].quizCategoryString??"",);
                            case 9:
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: CheckboxData(Questiontext: questionController.questionData[index].questionText??"Question",category: questionController.questionData[index].quizCategoryString??"category",val:int.parse(questionController.selectedOptions[questionController.questionData[index].id]??"0"),onChange: (val) {
                                  questionController.updateSelectedOption(questionController.questionData[index].id??0, "${val}",questionController.questionData[index].questionType??0);
                                },),
                              );
                            case 10:
                              return Card(
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(questionController.questionData[index].questionText??"Question"),
                      ...?questionController.questionData[index].option?.map((e) {
                        return Obx(() {
                          return RadioListTile<String>(
                            title: Text(e.optionText ?? "na"),
                            value: e.optionText ?? "na",
                            groupValue: questionController.selectedOptions[questionController.questionData[index].id],
                            onChanged: (value) {
                            ( questionController.questionData[index].option??[]).forEach((element) { 
                            if (element.optionText==value) {
                                 questionController.updateSelectedOption(questionController.questionData[index].id??0, "${element.id??0}",questionController.questionData[index].questionType??0);
                            }
                            });
                            },
                          );
                        });
                      }).toList(),
                       
                    ],
                                    ),
                                  ),
                                );
                              
                            
                    default:
                              return Container();
                          }
                          },
                      ),
                    ),
                  );
              }
              }
            ),

       
          ],
        ),
      ),
    );
  }
}
