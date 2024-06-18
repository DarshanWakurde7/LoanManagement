class Data {
  int? accountId;
  int? userId;
  int? roleId;
  int? managerId;
  int? activeStatusId;
  int? userApproveStatusId;
  int? kycStatus;
  String? firstName;
  String? lastName;
  String? companyName;
  int? countryCodeId1;
  int? userPhone;
  int? countryCodeId2;
  String? alternatePhone;
  String? userEmail;
  String? alternateEmail;
  String? username;
  String? kycDate;
  int? gstNumber;
  int? otp;
  int? pin;
  String? dob;
  String? panNumber;
  String? resetPasswordToken;
  String? companyAddress;
  String? profilePath;
  String? adharCardPhoto;
  String? pancardPhoto;
  String? accountNo;
  String? bankName;
  String? branchAddress;
  String? ifscCode;
  String? referralCode;
  int? partnerCode;
  String? addressLine1;
  String? addressLine2;
  String? addressLine3;
  String? city;
  String? state;
  String? address;
  int? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  String? accountName;
  String? accountPhone;
  String? accountDisplayName;
  String? productDisplayName;
  String? accountLogo;
  int? moduleId;
  String? accountEmail;

  Data(
      {this.accountId,
      this.userId,
      this.roleId,
      this.managerId,
      this.activeStatusId,
      this.userApproveStatusId,
      this.kycStatus,
      this.firstName,
      this.lastName,
      this.companyName,
      this.countryCodeId1,
      this.userPhone,
      this.countryCodeId2,
      this.alternatePhone,
      this.userEmail,
      this.alternateEmail,
      this.username,
      this.kycDate,
      this.gstNumber,
      this.otp,
      this.pin,
      this.dob,
      this.panNumber,
      this.resetPasswordToken,
      this.companyAddress,
      this.profilePath,
      this.adharCardPhoto,
      this.pancardPhoto,
      this.accountNo,
      this.bankName,
      this.branchAddress,
      this.ifscCode,
      this.referralCode,
      this.partnerCode,
      this.addressLine1,
      this.addressLine2,
      this.addressLine3,
      this.city,
      this.state,
      this.address,
      this.createdBy,
      this.createdAt,
      this.updatedBy,
      this.updatedAt,
      this.accountName,
      this.accountPhone,
      this.accountDisplayName,
      this.productDisplayName,
      this.accountLogo,
      this.moduleId,
      this.accountEmail});

  Data.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    userId = json['user_id'];
    roleId = json['role_id'];
    managerId = json['manager_id'];
    activeStatusId = json['active_status_id'];
    userApproveStatusId = json['user_approve_status_id'];
    kycStatus = json['kyc_status'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    companyName = json['company_name'];
    countryCodeId1 = json['country_code_id_1'];
    userPhone = json['user_phone'];
    countryCodeId2 = json['country_code_id_2'];
    alternatePhone = json['alternate_phone'];
    userEmail = json['user_email'];
    alternateEmail = json['alternate_email'];
    username = json['username'];
    kycDate = json['kyc_date'];
    gstNumber = json['gst_number'];
    otp = json['otp'];
    pin = json['pin'];
    dob = json['dob'];
    panNumber = json['pan_number'];
    resetPasswordToken = json['reset_password_token'];
    companyAddress = json['company_address'];
    profilePath = json['profile_path'];
    adharCardPhoto = json['adhar_card_photo'];
    pancardPhoto = json['pancard_photo'];
    accountNo = json['account_no'];
    bankName = json['bank_name'];
    branchAddress = json['branch_address'];
    ifscCode = json['ifsc_code'];
    referralCode = json['referral_code'];
    partnerCode = json['partner_code'];
    addressLine1 = json['address_line_1'];
    addressLine2 = json['address_line_2'];
    addressLine3 = json['address_line_3'];
    city = json['city'];
    state = json['state'];
    address = json['address'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedBy = json['updated_by'];
    updatedAt = json['updated_at'];
    accountName = json['account_name'];
    accountPhone = json['account_phone'];
    accountDisplayName = json['account_display_name'];
    productDisplayName = json['product_display_name'];
    accountLogo = json['account_logo'];
    moduleId = json['module_id'];
    accountEmail = json['account_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_id'] = this.accountId;
    data['user_id'] = this.userId;
    data['role_id'] = this.roleId;
    data['manager_id'] = this.managerId;
    data['active_status_id'] = this.activeStatusId;
    data['user_approve_status_id'] = this.userApproveStatusId;
    data['kyc_status'] = this.kycStatus;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['company_name'] = this.companyName;
    data['country_code_id_1'] = this.countryCodeId1;
    data['user_phone'] = this.userPhone;
    data['country_code_id_2'] = this.countryCodeId2;
    data['alternate_phone'] = this.alternatePhone;
    data['user_email'] = this.userEmail;
    data['alternate_email'] = this.alternateEmail;
    data['username'] = this.username;
    data['kyc_date'] = this.kycDate;
    data['gst_number'] = this.gstNumber;
    data['otp'] = this.otp;
    data['pin'] = this.pin;
    data['dob'] = this.dob;
    data['pan_number'] = this.panNumber;
    data['reset_password_token'] = this.resetPasswordToken;
    data['company_address'] = this.companyAddress;
    data['profile_path'] = this.profilePath;
    data['adhar_card_photo'] = this.adharCardPhoto;
    data['pancard_photo'] = this.pancardPhoto;
    data['account_no'] = this.accountNo;
    data['bank_name'] = this.bankName;
    data['branch_address'] = this.branchAddress;
    data['ifsc_code'] = this.ifscCode;
    data['referral_code'] = this.referralCode;
    data['partner_code'] = this.partnerCode;
    data['address_line_1'] = this.addressLine1;
    data['address_line_2'] = this.addressLine2;
    data['address_line_3'] = this.addressLine3;
    data['city'] = this.city;
    data['state'] = this.state;
    data['address'] = this.address;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_by'] = this.updatedBy;
    data['updated_at'] = this.updatedAt;
    data['account_name'] = this.accountName;
    data['account_phone'] = this.accountPhone;
    data['account_display_name'] = this.accountDisplayName;
    data['product_display_name'] = this.productDisplayName;
    data['account_logo'] = this.accountLogo;
    data['module_id'] = this.moduleId;
    data['account_email'] = this.accountEmail;
    return data;
  }
}