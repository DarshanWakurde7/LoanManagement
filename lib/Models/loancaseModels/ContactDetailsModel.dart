class ContactDetailsApplicant {
  int? loanCaseId;
  int? contactId;
  String? contactName;
  int? contactCibil;
  int? contactPhone;
  String? contactType;

  ContactDetailsApplicant(
      {this.loanCaseId,
      this.contactId,
      this.contactName,
      this.contactCibil,
      this.contactPhone,
      this.contactType});

  ContactDetailsApplicant.fromJson(Map<String, dynamic> json) {
    loanCaseId = json['loan_case_id'];
    contactId = json['contact_id'];
    contactName = json['contact_name'];
    contactCibil = json['contact_cibil'];
    contactPhone = json['contact_phone'];
    contactType = json['contact_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loan_case_id'] = this.loanCaseId;
    data['contact_id'] = this.contactId;
    data['contact_name'] = this.contactName;
    data['contact_cibil'] = this.contactCibil;
    data['contact_phone'] = this.contactPhone;
    data['contact_type'] = this.contactType;
    return data;
  }
}