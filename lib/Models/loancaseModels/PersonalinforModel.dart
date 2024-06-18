class PersonalInformation {
  String? fname;
  String? lname;
  int? phone;
  int? whatsappNo;
  String? email;
  int? accountId;
  String? motherName;
  String? bussinessProfile;
  String? creditturnover;
  int? createdBy;
  int? assignedTo;
  int? state;
  int? city;
  String? pin;
  String? companyName;
  String? currentAddress;
  String? permanentAddress;
  String? panNumber;
  String? dateOfBirth;
  String? caseDate;
  int? loanType;
  int? loanCaseStatusId;
  String? businessName;
  int? salesManager;
  int? creditManager;
  int? partnerId;
  String? cibilScore;
  int? residentialOfficeOwnership;
  int? commercialOfficeOwnership;
  int? residentialHomeOwnership;
  int? permanentHomeOwnership;
  String? profile;
  String? officeAddress;
  String? alreadyApplied;
  String? distLocation;
  String? liveLoan;
  int? requestedLoanAmount;
  int? gender;

  PersonalInformation({
    this.fname,
    this.lname,
    this.phone,
    this.whatsappNo,
    this.email,
    this.accountId,
    this.motherName,
    this.createdBy,
    this.assignedTo,
    this.state,
    this.city,
    this.pin,
    this.companyName,
    this.currentAddress,
    this.permanentAddress,
    this.panNumber,
    this.dateOfBirth,
    this.caseDate,
    this.loanType,
    this.loanCaseStatusId,
    this.businessName,
    this.salesManager,
    this.creditManager,
    this.partnerId,
    this.cibilScore,
    this.residentialOfficeOwnership,
    this.commercialOfficeOwnership,
    this.residentialHomeOwnership,
    this.permanentHomeOwnership,
    this.profile,
    this.officeAddress,
    this.alreadyApplied,
    this.distLocation,
    this.liveLoan,
    this.requestedLoanAmount,
    this.gender,
    this.creditturnover,
    this.bussinessProfile,
  });

  PersonalInformation.fromJson(Map<String, dynamic> json) {
    fname = json['fname'];
    lname = json['lname'];
    phone = json['phone'];
    whatsappNo = json['whatsapp_no'];
    email = json['email'];
    accountId = json['account_id'];
    motherName = json['mother_name'];
    createdBy = json['created_by'];
    assignedTo = json['assigned_to'];
    state = json['state'];
    city = json['city'];
    pin = json['pin'];
    creditturnover = json['credit_turnover'];
    bussinessProfile = json['business_profile'];
    companyName = json['company_name'];
    currentAddress = json['current_address'];
    permanentAddress = json['permanent_address'];
    panNumber = json['pan_number'];
    dateOfBirth = json['date_of_birth'];
    caseDate = json['case_date'];
    loanType = json['loan_type'];
    loanCaseStatusId = json['loan_case_status_id'];
    businessName = json['business_name'];
    salesManager = json['sales_manager'];
    creditManager = json['credit_manager'];
    partnerId = json['partner_id'];
    cibilScore = json['cibil_score'];
    residentialOfficeOwnership = json['residential_office_ownership'];
    commercialOfficeOwnership = json['commercial_office_ownership'];
    residentialHomeOwnership = json['residential_home_ownership'];
    permanentHomeOwnership = json['permanent_home_ownership'];
    profile = json['profile'];
    officeAddress = json['office_address'];
    alreadyApplied = json['already_applied'];
    distLocation = json['dist_location'];
    liveLoan = json['live_loan'];
    requestedLoanAmount = json['requested_loan_amount'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['phone'] = this.phone;
    data['whatsapp_no'] = this.whatsappNo;
    data['email'] = this.email;
    data['account_id'] = this.accountId;
    data['mother_name'] = this.motherName;
    data['created_by'] = this.createdBy;
    data['assigned_to'] = this.assignedTo;
    data['state'] = this.state;
    data['city'] = this.city;
    data['pin'] = this.pin;
    data['company_name'] = this.companyName;
    data['current_address'] = this.currentAddress;
    data['permanent_address'] = this.permanentAddress;
    data['pan_number'] = this.panNumber;
    data['date_of_birth'] = this.dateOfBirth;
    data['case_date'] = this.caseDate;
    data['loan_type'] = this.loanType;
    data['loan_case_status_id'] = this.loanCaseStatusId;
    data['business_name'] = this.businessName;
    data['sales_manager'] = this.salesManager;
    data['credit_manager'] = this.creditManager;
    data['partner_id'] = this.partnerId;
    data['cibil_score'] = this.cibilScore;
    data['residential_office_ownership'] = this.residentialOfficeOwnership;
    data['commercial_office_ownership'] = this.commercialOfficeOwnership;
    data['residential_home_ownership'] = this.residentialHomeOwnership;
    data['permanent_home_ownership'] = this.permanentHomeOwnership;
    data['profile'] = this.profile;
    data['office_address'] = this.officeAddress;
    data['already_applied'] = this.alreadyApplied;
    data['dist_location'] = this.distLocation;
    data['live_loan'] = this.liveLoan;
    data['requested_loan_amount'] = this.requestedLoanAmount;
    data['gender'] = this.gender;
    data['credit_turnover'] = this.creditturnover;
    data['business_profile'] = this.bussinessProfile;
    return data;
  }
}
