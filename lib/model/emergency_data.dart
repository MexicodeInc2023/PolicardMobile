class EmergencyData {
  late int id;
  late String emergencyName;
  late String emergencyPhone;
  late String? emergencyPhone2;
  late String bloodType;
  late String? allergy;
  late String? allergy2;

  EmergencyData({
    required this.emergencyName,
    required this.emergencyPhone,
    this.emergencyPhone2,
    required this.bloodType,
    this.allergy,
    this.allergy2,
  });

  EmergencyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    emergencyName = json['emergencyName'];
    emergencyPhone = json['emergencyPhone'];
    emergencyPhone2 = json['emergencyPhone2'];
    bloodType = json['bloodType'];
    allergy = json['allergy'];
    allergy2 = json['allergy2'];
    emergencyName = json['emergencyName'];
    emergencyPhone = json['emergencyPhone'];
    emergencyPhone2 = json['emergencyPhone2'];
    bloodType = json['bloodType'];
    allergy = json['allergy'];
    allergy2 = json['allergy2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['emergencyName'] = emergencyName;
    data['emergencyPhone'] = emergencyPhone;
    data['emergencyPhone2'] = emergencyPhone2;
    data['bloodType'] = bloodType;
    data['allergy'] = allergy;
    data['allergy2'] = allergy2;
    return data;
  }
}
