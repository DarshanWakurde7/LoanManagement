class Abb_Model {
  int? abbId;
  String? date;
  int? year;
  String? month;
  int? onDay1;
  int? onDay5;
  int? onDay10;
  int? onDay15;
  int? onDay20;
  int? onDay25;
  int? loanCaseId;
  int? createdBy;
  String? createdAt;
  int? updatedBy;
  String? updatedAt;
  dynamic? averageMonth;

  Abb_Model(
      {this.abbId,
      this.date,
      this.year,
      this.month,
      this.onDay1,
      this.onDay5,
      this.onDay10,
      this.onDay15,
      this.onDay20,
      this.onDay25,
      this.loanCaseId,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.averageMonth});

  Abb_Model.fromJson(Map<String, dynamic> json) {
    abbId = json['abb_id'];
    date = json['date'];
    year = json['year'];
    month = json['month'];
    onDay1 = json['on_day_1'];
    onDay5 = json['on_day_5'];
    onDay10 = json['on_day_10'];
    onDay15 = json['on_day_15'];
    onDay20 = json['on_day_20'];
    onDay25 = json['on_day_25'];
    loanCaseId = json['loan_case_id'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
    averageMonth = json['average_month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['abb_id'] = this.abbId;
    data['date'] = this.date;
    data['year'] = this.year;
    data['month'] = this.month;
    data['on_day_1'] = this.onDay1;
    data['on_day_5'] = this.onDay5;
    data['on_day_10'] = this.onDay10;
    data['on_day_15'] = this.onDay15;
    data['on_day_20'] = this.onDay20;
    data['on_day_25'] = this.onDay25;
    data['loan_case_id'] = this.loanCaseId;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_by'] = this.updatedBy;
    data['updated_at'] = this.updatedAt;
    data['average_month'] = this.averageMonth;
    return data;
  }
}