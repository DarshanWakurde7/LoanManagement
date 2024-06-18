class RTRModel {
  int? rtrId;
  int? loanCaseId;
  String? financerName;
  int? product;
  int? sanctionAmount;
  String? openDate;
  int? emiAmount;
  int? tenure;
  String? emiDate;
  int? emiBankAccountType;
  String? emiBankName;
  int? outStanding;
  String? emiCloserDate;
  int? createdBy;
  String? createdAt;
  String? updatedAt;
  int? updatedBy;
  String? createdByString;
  String? emiBankAccountTypeString;
  String? productString;

  RTRModel(
      {this.rtrId,
      this.loanCaseId,
      this.financerName,
      this.product,
      this.sanctionAmount,
      this.openDate,
      this.emiAmount,
      this.tenure,
      this.emiDate,
      this.emiBankAccountType,
      this.emiBankName,
      this.outStanding,
      this.emiCloserDate,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.updatedBy,
      this.createdByString,
      this.emiBankAccountTypeString,
      this.productString});

  RTRModel.fromJson(Map<String, dynamic> json) {
    rtrId = json['rtr_id'];
    loanCaseId = json['loan_case_id'];
    financerName = json['financer_name'];
    product = json['product'];
    sanctionAmount = json['sanction_amount'];
    openDate = json['open_date'];
    emiAmount = json['emi_amount'];
    tenure = json['tenure'];
    emiDate = json['emi_date'];
    emiBankAccountType = json['emi_bank_account_type'];
    emiBankName = json['emi_bank_name'];
    outStanding = json['out_standing'];
    emiCloserDate = json['emi_closer_date'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
    createdByString = json['created_by_string'];
    emiBankAccountTypeString = json['emi_bank_account_type_string'];
    productString = json['product_string'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rtr_id'] = this.rtrId;
    data['loan_case_id'] = this.loanCaseId;
    data['financer_name'] = this.financerName;
    data['product'] = this.product;
    data['sanction_amount'] = this.sanctionAmount;
    data['open_date'] = this.openDate;
    data['emi_amount'] = this.emiAmount;
    data['tenure'] = this.tenure;
    data['emi_date'] = this.emiDate;
    data['emi_bank_account_type'] = this.emiBankAccountType;
    data['emi_bank_name'] = this.emiBankName;
    data['out_standing'] = this.outStanding;
    data['emi_closer_date'] = this.emiCloserDate;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['created_by_string'] = this.createdByString;
    data['emi_bank_account_type_string'] = this.emiBankAccountTypeString;
    data['product_string'] = this.productString;
    return data;
  }
}