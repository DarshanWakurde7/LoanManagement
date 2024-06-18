class QuestionData {
  int? id;
  String? questionText;
  int? questionType;
  String? points;
  int? isActive;
  int? category;
  int? subCategory;
  String? evaluationType;
  String? shortTextAnswer;
  String? longTextAnswer;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  dynamic answer; // This can be String, List<int>, bool, etc.
  String? quizCategoryString;
  String? questionTypeString;
  String? quizSubCategoryString;
  String? createdByString;
  String? updatedByString;
  List<Option>? option;

  QuestionData(
      {this.id,
      this.questionText,
      this.questionType,
      this.points,
      this.isActive,
      this.category,
      this.subCategory,
      this.evaluationType,
      this.shortTextAnswer,
      this.longTextAnswer,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.answer,
      this.quizCategoryString,
      this.questionTypeString,
      this.quizSubCategoryString,
      this.createdByString,
      this.updatedByString,
      this.option});

  QuestionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionText = json['question_text'];
    questionType = json['question_type'];
    points = json['points'];
    isActive = json['is_active'];
    category = json['category'];
    subCategory = json['sub_category'];
    evaluationType = json['evaluation_type'];
    shortTextAnswer = json['short_text_answer'];
    longTextAnswer = json['long_text_answer'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
    answer = json['answer']; // Leave answer as it is, to be set dynamically
    quizCategoryString = json['quiz_category_string'];
    questionTypeString = json['question_type_string'];
    quizSubCategoryString = json['quiz_sub_category_string'];
    createdByString = json['created_by_string'];
    updatedByString = json['updated_by_string'];
    if (json['option'] != null) {
      option = <Option>[];
      json['option'].forEach((v) {
        option!.add(Option.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question_text'] = questionText;
    data['question_type'] = questionType;
    data['points'] = points;
    data['is_active'] = isActive;
    data['category'] = category;
    data['sub_category'] = subCategory;
    data['evaluation_type'] = evaluationType;
    data['short_text_answer'] = shortTextAnswer;
    data['long_text_answer'] = longTextAnswer;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    data['updated_by'] = updatedBy;
    data['updated_at'] = updatedAt;
    data['answer'] = answer; // Handle different types of answer
    data['quiz_category_string'] = quizCategoryString;
    data['question_type_string'] = questionTypeString;
    data['quiz_sub_category_string'] = quizSubCategoryString;
    data['created_by_string'] = createdByString;
    data['updated_by_string'] = updatedByString;
    if (option != null) {
      data['option'] = option!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Option {
  int? id;
  int? questionId;
  String? optionText;
  int? isCorrectOption;
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;

  Option(
      {this.id,
      this.questionId,
      this.optionText,
      this.isCorrectOption,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt});

  Option.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionId = json['question_id'];
    optionText = json['option_text'];
    isCorrectOption = json['is_correct_option'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question_id'] = questionId;
    data['option_text'] = optionText;
    data['is_correct_option'] = isCorrectOption;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    data['updated_by'] = updatedBy;
    data['updated_at'] = updatedAt;
    return data;
  }
}
