class ContacTypeModel {
  int? contactTypeId;
  String? contactType;

  ContacTypeModel({this.contactTypeId, this.contactType});

  ContacTypeModel.fromJson(Map<String, dynamic> json) {
    contactTypeId = json['contact_type_id'];
    contactType = json['contact_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact_type_id'] = this.contactTypeId;
    data['contact_type'] = this.contactType;
    return data;
  }
}