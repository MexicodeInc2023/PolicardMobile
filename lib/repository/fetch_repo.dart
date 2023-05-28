import 'package:policard_mobile/base/api_base.dart';
import 'package:policard_mobile/model/careers_data.dart';
import 'package:policard_mobile/model/emergency_data.dart';
import 'package:policard_mobile/model/student.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class RepositoryFetchData {
  var accessToken = SharedData.responseJson;
  final String _key = "api/user/student/1/";
  final ApiBase _base = ApiBase();

  Future<List<Students>> fetchStudent() async {
    final localData = await loadLocalData();
    if (localData.isNotEmpty) {
      return localData;
    } else {
      final response = await _base.getData(_key, accessToken);
      List<Students> students = (response["studentsData"] as List)
          .map((e) => Students.fromJson(e))
          .toList();

      students.forEach((student) {
        student.emergencyData =
            (response["emergencyData"] as List).map((e) => EmergencyData.fromJson(e)).toList();
        student.careersData =
            (response["careersData"] as List).map((e) => CareersData.fromJson(e)).toList();
      });

      await saveDataLocally(students); // Guardar los datos obtenidos localmente

      return students;
    }
  }

  Future<void> saveDataLocally(List<Students> students) async {
    final preferences = await SharedPreferences.getInstance();
    final studentsData = students.map((student) => jsonEncode(student.toJson())).toList();
    await preferences.setStringList('studentsData', studentsData);
  }

  Future<List<Students>> loadLocalData() async {
    final preferences = await SharedPreferences.getInstance();
    final studentsData = preferences.getStringList('studentsData');
    if (studentsData != null) {
      return studentsData
          .map((student) => Students.fromJson(jsonDecode(student)))
          .toList();
    } else {
      return [];
    }
  }
}

  