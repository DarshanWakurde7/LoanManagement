class Dahboard_Data {
  int? enquiryStatusId;
  String? label;
  int? count;

  Dahboard_Data({this.enquiryStatusId, this.label, this.count});

  Dahboard_Data.fromJson(Map<String, dynamic> json) {
    enquiryStatusId = json['enquiry_status_id'];
    label = json['label'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enquiry_status_id'] = this.enquiryStatusId;
    data['label'] = this.label;
    data['count'] = this.count;
    return data;
  }
}