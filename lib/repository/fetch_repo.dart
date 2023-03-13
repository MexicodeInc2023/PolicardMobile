import 'package:policard_mobile/base/api_base.dart';
import 'package:policard_mobile/model/careers_data.dart';
import 'package:policard_mobile/model/emergency_data.dart';
import 'package:policard_mobile/model/student.dart';

class RepositoryFetchData {
  var accessToken = SharedData.responseJson;
  final String _key = "api/user/student/1/";
  final ApiBase _base = ApiBase();

  Future<List<Students>> fetchStudent() async {
    // Obtenemos los datos de estudiante
    final response = await _base.getData(_key, accessToken);
    List<Students> students = (response["studentsData"] as List)
        .map((e) => Students.fromJson(e))
        .toList();
    // Obtener datos de emergencia
    List<EmergencyData> emergencyData = (response["emergencyData"] as List)
        .map((e) => EmergencyData.fromJson(e))
        .toList();

    // Obtener datos de carreras
    List<CareersData> careersData = (response["careersData"] as List)
        .map((e) => CareersData.fromJson(e))
        .toList();

    // Agregar los datos de emergencia y de carreras a cada estudiante correspondiente
    students.forEach((student) {
      student.emergencyData =
          emergencyData.toList();
      student.careersData =
          careersData.toList();
    });
    return students;
  }
}
