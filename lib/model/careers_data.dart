class CareersData {
  late int id;
  late String nameCareer;
  late String createdAt;
  late String updatedAt;

  CareersData({
    required this.nameCareer,
  });

  CareersData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameCareer = json['nameCareer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nameCareer'] = nameCareer;
    return data;
  }
}
