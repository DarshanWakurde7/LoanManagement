class DropdownModel {
  List<LoanType>? loanType;
  List<EnquiryMode>? enquiryMode;
  List<CompanyLocation>? companyLocation;
  List<CreditManager>? creditManager;
  List<States>? state;
  List<SalesManager>? salesManager;
  List<PartnerList>? partnerList;
  List<LeadLevel>? leadLevel;
  List<EnquiryStatus>? enquiryStatus;
  List<ApplicantType>? applicantType;
  List<PaymentStatus>? paymentStatus;

  DropdownModel(
      {this.loanType,
      this.enquiryMode,
      this.companyLocation,
      this.creditManager,
      this.state,
      this.salesManager,
      this.partnerList,
      this.leadLevel,
      this.enquiryStatus,
      this.applicantType,
      this.paymentStatus});

  DropdownModel.fromJson(Map<String, dynamic> json) {
    if (json['loan_type'] != null) {
      loanType = <LoanType>[];
      json['loan_type'].forEach((v) {
        loanType!.add(new LoanType.fromJson(v));
      });
    }
    if (json['enquiry_mode'] != null) {
      enquiryMode = <EnquiryMode>[];
      json['enquiry_mode'].forEach((v) {
        enquiryMode!.add(new EnquiryMode.fromJson(v));
      });
    }
    if (json['company_location'] != null) {
      companyLocation = <CompanyLocation>[];
      json['company_location'].forEach((v) {
        companyLocation!.add(new CompanyLocation.fromJson(v));
      });
    }
    if (json['credit_manager'] != null) {
      creditManager = <CreditManager>[];
      json['credit_manager'].forEach((v) {
        creditManager!.add(new CreditManager.fromJson(v));
      });
    }
    if (json['state'] != null) {
      state = <States>[];
      json['state'].forEach((v) {
        state!.add(new States.fromJson(v));
      });
    }
    if (json['sales_manager'] != null) {
      salesManager = <SalesManager>[];
      json['sales_manager'].forEach((v) {
        salesManager!.add(new SalesManager.fromJson(v));
      });
    }
    if (json['partner_list'] != null) {
      partnerList = <PartnerList>[];
      json['partner_list'].forEach((v) {
        partnerList!.add(new PartnerList.fromJson(v));
      });
    }
    if (json['lead_level'] != null) {
      leadLevel = <LeadLevel>[];
      json['lead_level'].forEach((v) {
        leadLevel!.add(new LeadLevel.fromJson(v));
      });
    }
    if (json['enquiry_status'] != null) {
      enquiryStatus = <EnquiryStatus>[];
      json['enquiry_status'].forEach((v) {
        enquiryStatus!.add(new EnquiryStatus.fromJson(v));
      });
    }
    if (json['applicant_type'] != null) {
      applicantType = <ApplicantType>[];
      json['applicant_type'].forEach((v) {
        applicantType!.add(new ApplicantType.fromJson(v));
      });
    }
    if (json['payment_status'] != null) {
      paymentStatus = <PaymentStatus>[];
      json['payment_status'].forEach((v) {
        paymentStatus!.add(new PaymentStatus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.loanType != null) {
      data['loan_type'] = this.loanType!.map((v) => v.toJson()).toList();
    }
    if (this.enquiryMode != null) {
      data['enquiry_mode'] = this.enquiryMode!.map((v) => v.toJson()).toList();
    }
    if (this.companyLocation != null) {
      data['company_location'] =
          this.companyLocation!.map((v) => v.toJson()).toList();
    }
    if (this.creditManager != null) {
      data['credit_manager'] =
          this.creditManager!.map((v) => v.toJson()).toList();
    }
    if (this.state != null) {
      data['state'] = this.state!.map((v) => v.toJson()).toList();
    }
    if (this.salesManager != null) {
      data['sales_manager'] =
          this.salesManager!.map((v) => v.toJson()).toList();
    }
    if (this.partnerList != null) {
      data['partner_list'] = this.partnerList!.map((v) => v.toJson()).toList();
    }
    if (this.leadLevel != null) {
      data['lead_level'] = this.leadLevel!.map((v) => v.toJson()).toList();
    }
    if (this.enquiryStatus != null) {
      data['enquiry_status'] =
          this.enquiryStatus!.map((v) => v.toJson()).toList();
    }
    if (this.applicantType != null) {
      data['applicant_type'] =
          this.applicantType!.map((v) => v.toJson()).toList();
    }
    if (this.paymentStatus != null) {
      data['payment_status'] =
          this.paymentStatus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LoanType {
  int? loanTypeId;
  String? loanType;

  LoanType({this.loanTypeId, this.loanType});

  LoanType.fromJson(Map<String, dynamic> json) {
    loanTypeId = json['loan_type_id'];
    loanType = json['loan_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loan_type_id'] = this.loanTypeId;
    data['loan_type'] = this.loanType;
    return data;
  }
}


class SalesManager {
  String? firstName;
  String? lastName;
  int? userId;
  String? fullName;

  SalesManager({this.firstName, this.lastName, this.userId, this.fullName});

  SalesManager.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    userId = json['user_id'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_id'] = this.userId;
    data['full_name'] = this.fullName;
    return data;
  }
}
class PartnerList {
  String? firstName;
  String? lastName;
  int? userId;
  String? fullName;

  PartnerList({this.firstName, this.lastName, this.userId, this.fullName});

  PartnerList.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    userId = json['user_id'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_id'] = this.userId;
    data['full_name'] = this.fullName;
    return data;
  }
}




class States {
  int? stateId;
  String? stateName;

  States({this.stateId, this.stateName});

  States.fromJson(Map<String, dynamic> json) {
    stateId = json['state_id'];
    stateName = json['state_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state_id'] = this.stateId;
    data['state_name'] = this.stateName;
    return data;
  }
}

class EnquiryMode {
  int? enquiryModeId;
  String? enquiryMode;

  EnquiryMode({this.enquiryModeId, this.enquiryMode});

  EnquiryMode.fromJson(Map<String, dynamic> json) {
    enquiryModeId = json['enquiry_mode_id'];
    enquiryMode = json['enquiry_mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enquiry_mode_id'] = this.enquiryModeId;
    data['enquiry_mode'] = this.enquiryMode;
    return data;
  }
}

class CompanyLocation {
  int? companyLocationId;
  String? companyLocation;

  CompanyLocation({this.companyLocationId, this.companyLocation});

  CompanyLocation.fromJson(Map<String, dynamic> json) {
    companyLocationId = json['company_location_id'];
    companyLocation = json['company_location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_location_id'] = this.companyLocationId;
    data['company_location'] = this.companyLocation;
    return data;
  }
}

class CreditManager {
  String? firstName;
  String? lastName;
  int? userId;
  String? fullName;

  CreditManager({this.firstName, this.lastName, this.userId, this.fullName});

  CreditManager.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    userId = json['user_id'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_id'] = this.userId;
    data['full_name'] = this.fullName;
    return data;
  }
}

class LeadLevel {
  int? leadLevelId;
  int? accountId;
  String? leadLevel;
  String? createdBy;
  String? createdAt;

  LeadLevel(
      {this.leadLevelId,
      this.accountId,
      this.leadLevel,
      this.createdBy,
      this.createdAt});

  LeadLevel.fromJson(Map<String, dynamic> json) {
    leadLevelId = json['lead_level_id'];
    accountId = json['account_id'];
    leadLevel = json['lead_level'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lead_level_id'] = this.leadLevelId;
    data['account_id'] = this.accountId;
    data['lead_level'] = this.leadLevel;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class EnquiryStatus {
  int? enquiryStatusId;
  String? enquiryStatus;

  EnquiryStatus({this.enquiryStatusId, this.enquiryStatus});

  EnquiryStatus.fromJson(Map<String, dynamic> json) {
    enquiryStatusId = json['enquiry_status_id'];
    enquiryStatus = json['enquiry_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enquiry_status_id'] = this.enquiryStatusId;
    data['enquiry_status'] = this.enquiryStatus;
    return data;
  }
}

class ApplicantType {
  int? applicantTypeId;
  String? applicantType;

  ApplicantType({this.applicantTypeId, this.applicantType});

  ApplicantType.fromJson(Map<String, dynamic> json) {
    applicantTypeId = json['applicant_type_id'];
    applicantType = json['applicant_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicant_type_id'] = this.applicantTypeId;
    data['applicant_type'] = this.applicantType;
    return data;
  }
}

class PaymentStatus {
  int? paymentStatusId;
  String? paymentStatus;

  PaymentStatus({this.paymentStatusId, this.paymentStatus});

  PaymentStatus.fromJson(Map<String, dynamic> json) {
    paymentStatusId = json['payment_status_id'];
    paymentStatus = json['payment_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_status_id'] = this.paymentStatusId;
    data['payment_status'] = this.paymentStatus;
    return data;
  }
}