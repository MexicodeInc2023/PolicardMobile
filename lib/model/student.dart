import 'package:policard_mobile/model/careers_data.dart';
import 'package:policard_mobile/model/emergency_data.dart';

class Students {
  late int id;
  late String name;
  late String lastname;
  late String enrolment;
  late String birthdate;
  late int grade;
  late String city;
  late bool active;
  late String createdAt;
  late String updatedAt;
  late int userId;
  late List<EmergencyData>? emergencyData;
  late List<CareersData>? careersData;

  Students({
      required this.id,
      required this.name,
      required this.lastname,
      required this.enrolment,
      required this.birthdate,
      required this.grade,
      required this.city,
      this.active = true,
      required this.emergencyData,
      required this.careersData,
      required this.userId
      });

  Students.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastname = json['lastname'];
    enrolment = json['enrolment'];
    birthdate = json['birthdate'];
    grade = json['grade'];
    city = json['city'];
    active = json['active'];
    userId = json['userId'];
    careersData = (json['careersData'] as List<dynamic>?)
        ?.map((e) => CareersData.fromJson(e))
        .toList();
    emergencyData = (json['emergencyData'] as List<dynamic>?)
        ?.map((e) => EmergencyData.fromJson(e))
        .toList();}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['lastname'] = lastname;
    data['enrolment'] = enrolment;
    data['birthdate'] = birthdate;
    data['grade'] = grade;
    data['city'] = city;
    data['active'] = active;
    data['userId'] = userId;
    data['emergencyData'] = emergencyData;
    data['careersData'] = careersData;

    return data;
  }
}
