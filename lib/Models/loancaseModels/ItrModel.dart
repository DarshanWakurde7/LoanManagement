class Itr_Model {
  int? itrId;
  int? loanCaseId;
  int? totalIncome;
  int? netProfit;
  String? plSale;
  String? taxPayable;
  int? toInterestOnLoan;
  String? toDepreciation;
  int? salaryRemuneration;
  String? capitalBs;
  int? securedLoan;
  int? plGrossProfit;
  String? loanFrom;
  int? year;
  String? remarks;
  int? unsecuredLoan;
  String? balanceSheetSize;
  int? itrFillingYear;
  String? growth;
  String? filingDate;
  int? createdBy;
  String? createdAt;
  String? updatedAt;
  int? updatedBy;

  Itr_Model(
      {this.itrId,
      this.loanCaseId,
      this.totalIncome,
      this.netProfit,
      this.plSale,
      this.taxPayable,
      this.toInterestOnLoan,
      this.toDepreciation,
      this.salaryRemuneration,
      this.capitalBs,
      this.securedLoan,
      this.plGrossProfit,
      this.loanFrom,
      this.year,
      this.remarks,
      this.unsecuredLoan,
      this.balanceSheetSize,
      this.itrFillingYear,
      this.growth,
      this.filingDate,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.updatedBy});

  Itr_Model.fromJson(Map<String, dynamic> json) {
    itrId = json['itr_id'];
    loanCaseId = json['loan_case_id'];
    totalIncome = json['total_income'];
    netProfit = json['net_profit'];
    plSale = json['pl_sale'];
    taxPayable = json['tax_payable'];
    toInterestOnLoan = json['to_interest_on_loan'];
    toDepreciation = json['to_depreciation'];
    salaryRemuneration = json['salary_remuneration'];
    capitalBs = json['capital_bs'];
    securedLoan = json['secured_loan'];
    plGrossProfit = json['pl_gross_profit'];
    loanFrom = json['loan_from'];
    year = json['year'];
    remarks = json['remarks'];
    unsecuredLoan = json['unsecured_loan'];
    balanceSheetSize = json['balance_sheet_size'];
    itrFillingYear = json['itr_filling_year'];
    growth = json['growth'];
    filingDate = json['filing_date'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itr_id'] = this.itrId;
    data['loan_case_id'] = this.loanCaseId;
    data['total_income'] = this.totalIncome;
    data['net_profit'] = this.netProfit;
    data['pl_sale'] = this.plSale;
    data['tax_payable'] = this.taxPayable;
    data['to_interest_on_loan'] = this.toInterestOnLoan;
    data['to_depreciation'] = this.toDepreciation;
    data['salary_remuneration'] = this.salaryRemuneration;
    data['capital_bs'] = this.capitalBs;
    data['secured_loan'] = this.securedLoan;
    data['pl_gross_profit'] = this.plGrossProfit;
    data['loan_from'] = this.loanFrom;
    data['year'] = this.year;
    data['remarks'] = this.remarks;
    data['unsecured_loan'] = this.unsecuredLoan;
    data['balance_sheet_size'] = this.balanceSheetSize;
    data['itr_filling_year'] = this.itrFillingYear;
    data['growth'] = this.growth;
    data['filing_date'] = this.filingDate;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}