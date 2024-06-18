class EnquiryModel {
  int? accountId;
  int? enquiryId;
  int? userId;
  String? businessName;
  int? salesManager;
  int? creditManager;
  String? cibilScore;
  int? currentOwnership;
  int? permanentOwnership;
  String? profile;
  String? alreadyApplied;
  String? distLocation;
  String? liveLoan;
  int? requestedLoanAmount;
  String? officeLocation;
  String? solutionForProcess;
  String? rejectionReason;
  String? recallDate;
  String? closerDate;
  int? applicantTypeId;
  int? userCreated;
  String? fname;
  String? lname;
  int? phone;
  int? whatsappNo;
  String? email;
  String? enquiryDate;
  int? loanType;
  int? loanAmount;
  int? disbursedLoneAmount;
  int? partnerCommisionPercentage;
  int? partnerCommisionAmount;
  int? paymentStatus;
  String? state;
  String? city;
  String? address;
  String? pin;
  String? dateOfBirth;
  int? leadLevelId;
  String? companyName;
  String? estimatedClosureDate;
  String? panNumber;
  String? notes;
  String? enqDetailMsg;
  String? nextAppointmentDate;
  int? enquiryModeId;
  int? enquiryTypeId;
  String? dataSource;
  String? enquiryDetails;
  String? loantypeString;
  int? enquiryStatusId;
  int? assignedTo;
  int? partnerId;
  int? createdBy;
  String? createdAt;
  int? updatedBy;
  String? updatedAt;
  int? isDeleted;
  String? createdFname;
  String? createdLname;
  int? loanCaseId;
  String? assignedFname;
  String? assignedLname;
  String? enquirySource;
  String? enquiryStatus;

  EnquiryModel(
      {this.accountId,
      this.enquiryId,
      this.userId,
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
      this.requestedLoanAmount,
      this.officeLocation,
      this.solutionForProcess,
      this.rejectionReason,
      this.recallDate,
      this.closerDate,
      this.applicantTypeId,
      this.userCreated,
      this.fname,
      this.lname,
      this.phone,
      this.whatsappNo,
      this.email,
      this.enquiryDate,
      this.loanType,
      this.loanAmount,
      this.disbursedLoneAmount,
      this.partnerCommisionPercentage,
      this.partnerCommisionAmount,
      this.paymentStatus,
      this.state,
      this.city,
      this.address,
      this.loantypeString,
      this.pin,
      this.dateOfBirth,
      this.leadLevelId,
      this.companyName,
      this.estimatedClosureDate,
      this.panNumber,
      this.notes,
      this.enqDetailMsg,
      this.nextAppointmentDate,
      this.enquiryModeId,
      this.enquiryTypeId,
      this.dataSource,
      this.enquiryDetails,
      this.enquiryStatusId,
      this.assignedTo,
      this.partnerId,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.isDeleted,
      this.createdFname,
      this.createdLname,
      this.loanCaseId,
      this.assignedFname,
      this.assignedLname,
      this.enquirySource,
      this.enquiryStatus});

  EnquiryModel.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    enquiryId = json['enquiry_id'];
    userId = json['user_id'];
    loantypeString = json['loan_type_string'];
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
    requestedLoanAmount = json['requested_loan_amount'];
    officeLocation = json['office_location'];
    solutionForProcess = json['solution_for_process'];
    rejectionReason = json['rejection_reason'];
    recallDate = json['Recall_date'];
    closerDate = json['closer_date'];
    applicantTypeId = json['applicant_type_id'];
    userCreated = json['user_created'];
    fname = json['fname'];
    lname = json['lname'];
    phone = json['phone'];
    whatsappNo = json['whatsapp_no'];
    email = json['email'];
    enquiryDate = json['enquiry_date'];
    loanType = json['loan_type'];
    loanAmount = json['loan_amount'];
    disbursedLoneAmount = json['disbursed_lone_amount'];
    partnerCommisionPercentage = json['partner_commision_percentage'];
    partnerCommisionAmount = json['partner_commision_amount'];
    paymentStatus = json['payment_status'];
    state = json['state'];
    city = json['city'];
    address = json['address'];
    pin = json['pin'];
    dateOfBirth = json['date_of_birth'];
    leadLevelId = json['lead_level_id'];
    companyName = json['company_name'];
    estimatedClosureDate = json['estimated_closure_date'];
    panNumber = json['pan_number'];
    notes = json['notes'];
    enqDetailMsg = json['enq_detail_msg'];
    nextAppointmentDate = json['next_appointment_date'];
    enquiryModeId = json['enquiry_mode_id'];
    enquiryTypeId = json['enquiry_type_id'];
    dataSource = json['data_source'];
    enquiryDetails = json['enquiry_details'];
    enquiryStatusId = json['enquiry_status_id'];
    assignedTo = json['assigned_to'];
    partnerId = json['partner_id'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
    isDeleted = json['is_deleted'];
    createdFname = json['created_fname'];
    createdLname = json['created_lname'];
    loanCaseId = json['loan_case_id'];
    assignedFname = json['assigned_fname'];
    assignedLname = json['assigned_lname'];
    enquirySource = json['enquiry_source'];
    enquiryStatus = json['enquiry_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_id'] = this.accountId;
    data['enquiry_id'] = this.enquiryId;
    data['user_id'] = this.userId;
    data['loan_type_string'] = this.loantypeString;
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
    data['requested_loan_amount'] = this.requestedLoanAmount;
    data['office_location'] = this.officeLocation;
    data['solution_for_process'] = this.solutionForProcess;
    data['rejection_reason'] = this.rejectionReason;
    data['Recall_date'] = this.recallDate;
    data['closer_date'] = this.closerDate;
    data['applicant_type_id'] = this.applicantTypeId;
    data['user_created'] = this.userCreated;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['phone'] = this.phone;
    data['whatsapp_no'] = this.whatsappNo;
    data['email'] = this.email;
    data['enquiry_date'] = this.enquiryDate;
    data['loan_type'] = this.loanType;
    data['loan_amount'] = this.loanAmount;
    data['disbursed_lone_amount'] = this.disbursedLoneAmount;
    data['partner_commision_percentage'] = this.partnerCommisionPercentage;
    data['partner_commision_amount'] = this.partnerCommisionAmount;
    data['payment_status'] = this.paymentStatus;
    data['state'] = this.state;
    data['city'] = this.city;
    data['address'] = this.address;
    data['pin'] = this.pin;
    data['date_of_birth'] = this.dateOfBirth;
    data['lead_level_id'] = this.leadLevelId;
    data['company_name'] = this.companyName;
    data['estimated_closure_date'] = this.estimatedClosureDate;
    data['pan_number'] = this.panNumber;
    data['notes'] = this.notes;
    data['enq_detail_msg'] = this.enqDetailMsg;
    data['next_appointment_date'] = this.nextAppointmentDate;
    data['enquiry_mode_id'] = this.enquiryModeId;
    data['enquiry_type_id'] = this.enquiryTypeId;
    data['data_source'] = this.dataSource;
    data['enquiry_details'] = this.enquiryDetails;
    data['enquiry_status_id'] = this.enquiryStatusId;
    data['assigned_to'] = this.assignedTo;
    data['partner_id'] = this.partnerId;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_by'] = this.updatedBy;
    data['updated_at'] = this.updatedAt;
    data['is_deleted'] = this.isDeleted;
    data['created_fname'] = this.createdFname;
    data['created_lname'] = this.createdLname;
    data['loan_case_id'] = this.loanCaseId;
    data['assigned_fname'] = this.assignedFname;
    data['assigned_lname'] = this.assignedLname;
    data['enquiry_source'] = this.enquirySource;
    data['enquiry_status'] = this.enquiryStatus;
    return data;
  }
}