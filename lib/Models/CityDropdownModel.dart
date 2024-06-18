class CityDropdownModel {
  int? cityId;
  String? cityName;
  String? prefix;

  CityDropdownModel({this.cityId, this.cityName, this.prefix});

  CityDropdownModel.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    cityName = json['city_name'];
    prefix = json['prefix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['prefix'] = this.prefix;
    return data;
  }
}