class AddEnquireModel {
  String? fname;
  String? lname;
  String? phone;
  String? whatsappNo;
  String? enquiryModeId;
  String? dataSource;
  String? email;
  String? accountId;
  String? enquiryStatusId;
  String? createdBy;
  String? assignedTo;
  String? state;
  String? city;
  String? pin;
  String? companyName;
  String? address;
  String? panNumber;
  String? dateOfBirth;
  String? enquiryDate;
  String? loanType;
  String? loanAmount;
  String? disbursedLoneAmount;
  String? partnerCommisionPercentage;
  String? partnerCommisionAmount;
  String? nextAppointmentDate;
  String? enqDetailMsg;
  String? leadLevelId;
  String? estimatedClosureDate;
  String? notes;
  String? businessName;
  String? salesManager;
  String? creditManager;
  String? cibilScore;
  String? currentOwnership;
  String? permanentOwnership;
  String? profile;
  String? alreadyApplied;
  String? distLocation;
  String? liveLoan;
  String? requiredLoanAmount;
  String? officeLocation;
  String? solutionForProcess;
  String? rejectionReason;
  String? recallDate;
  String? closerDate;

  AddEnquireModel(
      {this.fname,
      this.lname,
      this.phone,
      this.whatsappNo,
      this.enquiryModeId,
      this.dataSource,
      this.email,
      this.accountId,
      this.enquiryStatusId,
      this.createdBy,
      this.assignedTo,
      this.state,
      this.city,
      this.pin,
      this.companyName,
      this.address,
      this.panNumber,
      this.dateOfBirth,
      this.enquiryDate,
      this.loanType,
      this.loanAmount,
      this.disbursedLoneAmount,
      this.partnerCommisionPercentage,
      this.partnerCommisionAmount,
      this.nextAppointmentDate,
      this.enqDetailMsg,
      this.leadLevelId,
      this.estimatedClosureDate,
      this.notes,
      this.businessName,
      this.salesManager,
      this.creditManager,
      this.cibilScore,
      this.currentOwnership,
      this.permanentOwnership,
      this.profile,
      this.alreadyApplied,
      this.distLocation,
      this.liveLoan,
      this.requiredLoanAmount,
      this.officeLocation,
      this.solutionForProcess,
      this.rejectionReason,
      this.recallDate,
      this.closerDate});

  AddEnquireModel.fromJson(Map<String, dynamic> json) {
    fname = json['fname'];
    lname = json['lname'];
    phone = json['phone'];
    whatsappNo = json['whatsapp_no'];
    enquiryModeId = json['enquiry_mode_id'];
    dataSource = json['data_source'];
    email = json['email'];
    accountId = json['account_id'];
    enquiryStatusId = json['enquiry_status_id'];
    createdBy = json['created_by'];
    assignedTo = json['assigned_to'];
    state = json['state'];
    city = json['city'];
    pin = json['pin'];
    companyName = json['company_name'];
    address = json['address'];
    panNumber = json['pan_number'];
    dateOfBirth = json['date_of_birth'];
    enquiryDate = json['enquiry_date'];
    loanType = json['loan_type'];
    loanAmount = json['loan_amount'];
    disbursedLoneAmount = json['disbursed_lone_amount'];
    partnerCommisionPercentage = json['partner_commision_percentage'];
    partnerCommisionAmount = json['partner_commision_amount'];
    nextAppointmentDate = json['next_appointment_date'];
    enqDetailMsg = json['enq_detail_msg'];
    leadLevelId = json['lead_level_id'];
    estimatedClosureDate = json['estimated_closure_date'];
    notes = json['notes'];
    businessName = json['business_name'];
    salesManager = json['sales_manager'];
    creditManager = json['credit_manager'];
    cibilScore = json['cibil_score'];
    currentOwnership = json['current_ownership'];
    permanentOwnership = json['permanent_ownership'];
    profile = json['profile'];
    alreadyApplied = json['already_applied'];
    distLocation = json['dist_location'];
    liveLoan = json['live_loan'];
    requiredLoanAmount = json['required_loan_amount'];
    officeLocation = json['office_location'];
    solutionForProcess = json['solution_for_process'];
    rejectionReason = json['rejection_reason'];
    recallDate = json['Recall_date'];
    closerDate = json['closer_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['phone'] = this.phone;
    data['whatsapp_no'] = this.whatsappNo;
    data['enquiry_mode_id'] = this.enquiryModeId;
    data['data_source'] = this.dataSource;
    data['email'] = this.email;
    data['account_id'] = this.accountId;
    data['enquiry_status_id'] = this.enquiryStatusId;
    data['created_by'] = this.createdBy;
    data['assigned_to'] = this.assignedTo;
    data['state'] = this.state;
    data['city'] = this.city;
    data['pin'] = this.pin;
    data['company_name'] = this.companyName;
    data['address'] = this.address;
    data['pan_number'] = this.panNumber;
    data['date_of_birth'] = this.dateOfBirth;
    data['enquiry_date'] = this.enquiryDate;
    data['loan_type'] = this.loanType;
    data['loan_amount'] = this.loanAmount;
    data['disbursed_lone_amount'] = this.disbursedLoneAmount;
    data['partner_commision_percentage'] = this.partnerCommisionPercentage;
    data['partner_commision_amount'] = this.partnerCommisionAmount;
    data['next_appointment_date'] = this.nextAppointmentDate;
    data['enq_detail_msg'] = this.enqDetailMsg;
    data['lead_level_id'] = this.leadLevelId;
    data['estimated_closure_date'] = this.estimatedClosureDate;
    data['notes'] = this.notes;
    data['business_name'] = this.businessName;
    data['sales_manager'] = this.salesManager;
    data['credit_manager'] = this.creditManager;
    data['cibil_score'] = this.cibilScore;
    data['current_ownership'] = this.currentOwnership;
    data['permanent_ownership'] = this.permanentOwnership;
    data['profile'] = this.profile;
    data['already_applied'] = this.alreadyApplied;
    data['dist_location'] = this.distLocation;
    data['live_loan'] = this.liveLoan;
    data['required_loan_amount'] = this.requiredLoanAmount;
    data['office_location'] = this.officeLocation;
    data['solution_for_process'] = this.solutionForProcess;
    data['rejection_reason'] = this.rejectionReason;
    data['Recall_date'] = this.recallDate;
    data['closer_date'] = this.closerDate;
    return data;
  }
}