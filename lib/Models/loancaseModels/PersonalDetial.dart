class PersonalDetialsModel {
  int? loanCaseId;
  String? coFname;
  String? coLname;
  int? coPhone;
  int? coCibil;
  String? caBankName1;
  String? caBankName2;
  int? saCreditCardTurnover1;
  int? saCreditCardTurnover2;
  String? saBankName1;
  String? saBankName2;
  String? notes;
  int? itr1;
  int? itr2;
  int? itr3;
  String? nextAppointmentDate;
  String? pastDueDate;
  int? otherLoan;
  String? provideSolution;
  int? liveEmiAmount;
  int? latestFunding;
  int? liveLoanRtr;
  int? applicantTypeId;
  int? ccOd;
  int? maxDpd;
  String? dataSource;
  String? loanPurpose;
  String? note;
  String? rejectionReason;
  int? bplNo;
  int? hlNo;
  String? closerDate;

  PersonalDetialsModel(
      {this.loanCaseId,
      this.coFname,
      this.coLname,
      this.coPhone,
      this.coCibil,
      this.caBankName1,
      this.caBankName2,
      this.saCreditCardTurnover1,
      this.saCreditCardTurnover2,
      this.saBankName1,
      this.saBankName2,
      this.notes,
      this.itr1,
      this.itr2,
      this.itr3,
      this.nextAppointmentDate,
      this.pastDueDate,
      this.otherLoan,
      this.provideSolution,
      this.liveEmiAmount,
      this.latestFunding,
      this.liveLoanRtr,
      this.applicantTypeId,
      this.ccOd,
      this.maxDpd,
      this.dataSource,
      this.loanPurpose,
      this.note,
      this.rejectionReason,
      this.bplNo,
      this.hlNo,
      this.closerDate});

  PersonalDetialsModel.fromJson(Map<String, dynamic> json) {
    loanCaseId = json['loan_case_id'];
    coFname = json['co_fname'];
    coLname = json['co_lname'];
    coPhone = json['co_phone'];
    coCibil = json['co_cibil'];
    caBankName1 = json['ca_bank_name_1'];
    caBankName2 = json['ca_bank_name_2'];
    saCreditCardTurnover1 = json['sa_credit_card_turnover_1'];
    saCreditCardTurnover2 = json['sa_credit_card_turnover_2'];
    saBankName1 = json['sa_bank_name_1'];
    saBankName2 = json['sa_bank_name_2'];
    notes = json['notes'];
    itr1 = json['itr_1'];
    itr2 = json['itr_2'];
    itr3 = json['itr_3'];
    nextAppointmentDate = json['next_appointment_date'];
    pastDueDate = json['past_due_date'];
    otherLoan = json['other_loan'];
    provideSolution = json['provide_solution'];
    liveEmiAmount = json['live_emi_amount'];
    latestFunding = json['latest_funding'];
    liveLoanRtr = json['live_loan_rtr'];
    applicantTypeId = json['applicant_type_id'];
    ccOd = json['cc_od'];
    maxDpd = json['max_dpd'];
    dataSource = json['data_source'];
    loanPurpose = json['loan_purpose'];
    note = json['note'];
    rejectionReason = json['rejection_reason'];
    bplNo = json['bpl_no'];
    hlNo = json['hl_no'];
    closerDate = json['closer_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loan_case_id'] = this.loanCaseId;
    data['co_fname'] = this.coFname;
    data['co_lname'] = this.coLname;
    data['co_phone'] = this.coPhone;
    data['co_cibil'] = this.coCibil;
    data['ca_bank_name_1'] = this.caBankName1;
    data['ca_bank_name_2'] = this.caBankName2;
    data['sa_credit_card_turnover_1'] = this.saCreditCardTurnover1;
    data['sa_credit_card_turnover_2'] = this.saCreditCardTurnover2;
    data['sa_bank_name_1'] = this.saBankName1;
    data['sa_bank_name_2'] = this.saBankName2;
    data['notes'] = this.notes;
    data['itr_1'] = this.itr1;
    data['itr_2'] = this.itr2;
    data['itr_3'] = this.itr3;
    data['next_appointment_date'] = this.nextAppointmentDate;
    data['past_due_date'] = this.pastDueDate;
    data['other_loan'] = this.otherLoan;
    data['provide_solution'] = this.provideSolution;
    data['live_emi_amount'] = this.liveEmiAmount;
    data['latest_funding'] = this.latestFunding;
    data['live_loan_rtr'] = this.liveLoanRtr;
    data['applicant_type_id'] = this.applicantTypeId;
    data['cc_od'] = this.ccOd;
    data['max_dpd'] = this.maxDpd;
    data['data_source'] = this.dataSource;
    data['loan_purpose'] = this.loanPurpose;
    data['note'] = this.note;
    data['rejection_reason'] = this.rejectionReason;
    data['bpl_no'] = this.bplNo;
    data['hl_no'] = this.hlNo;
    data['closer_date'] = this.closerDate;
    return data;
  }
}