import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanmanagement/Apicalls/LoanApis.dart';
import 'package:loanmanagement/Models/loancaseModels/QuestionModel.dart';

class QuestionController extends GetxController {
  var isLoading = false.obs;
  var checkbox = false.obs;
   var  textEditingController = <TextEditingController>[].obs; // List of TextEditingController
  List<QuestionData> questionData = <QuestionData>[].obs;
   var selectedOptions = <int, dynamic>{}.obs;  

  @override
  void onInit() {
    getApiCallFor();
    
    super.onInit();
  }

  Future<void> getApiCallFor() async {
    isLoading(true);

    questionData = await APiClls.callQuestionApis();
    await initializeTextControllers(); // Initialize controllers based on questionData length
mapTheAnswers();
    isLoading(false);



    print(questionData);
  }

  Future<void> updateSelectedOption(int questionId, String selectedOption,int typeid) async {
    selectedOptions[questionId] = selectedOption;
    // Update the answer in the corresponding question data
    int index = questionData.indexWhere((question) => question.id == questionId);
    if (index != -1) {
      questionData[index].answer = selectedOption;
    }
    // Call add API here
    await APiClls.updateAnswerQuestion(questionId, selectedOption,typeid);
    getApiCallFor();
  }


  Future<void> initializeTextControllers()async {
    textEditingController.value = List.generate(
      questionData.length,
      (index) => TextEditingController(),
    );

    
   
  }
void mapTheAnswers() async{
  int count=0;
    questionData = await APiClls.callQuestionApis();
  questionData.forEach((element) {

    // Check for null values early and return
    if (element.questionType == null || element.answer == null) return;

    // Safely parse the answer to an integer
    int? answerId;
    try {
      answerId = int.parse(element.answer ?? '');
    } catch (e) {
      print('Error parsing answer to int: $e');
      return;
    }

    // Define a map for question type handling
    final questionTypeHandlers = {
      10: () {
        (element.option ?? []).forEach((ele) {
          if (ele.id == answerId && ele.optionText != null) {
            updateSelectedOption(element.id ?? 0, ele.optionText!,element.questionType??0);
          }
        });
      },
      1: () {
                (element.option ?? []).forEach((ele) {
          if (ele.id == answerId && ele.optionText != null) {
          
              updateSelectedOption(element.id ??34, element.answer,element.questionType??0);
          }
        });
     
      },
      // Add more handlers for other question types if needed
    };

    // Execute the handler based on the question type
    questionTypeHandlers[element.questionType]?.call();
  });
}


  void setheTextEdingController(int id,String val,List<Option> option){

   option.forEach((element) {
    if(element.id==int.parse(val)){
       textEditingController[id]=TextEditingController(text:element.optionText );
    }
    });

    
  }

  Future<void> checkboxdata(bool value) async {
    checkbox(value);
  }

  @override
  void onClose() {
    for (var controller in textEditingController) {
      controller.dispose();
    }
    super.onClose();
  }
}
