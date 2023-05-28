import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:policard_mobile/base/api_base.dart';
import 'package:policard_mobile/blocs/fetch_bloc/fetch_bloc.dart';

class Credential extends StatefulWidget {
  const Credential({super.key});

  @override
  State<Credential> createState() => _CredentialState();
}

class _CredentialState extends State<Credential> {
  final ApiBase _base = ApiBase();
  final Fetchbloc _bloc = Fetchbloc();
  // Obtenemos el token de la API

  /* _base.getData("api/user/student/1/", accessToken); */
  /*   var accessToken = SharedData.responseJson; */
  @override
  void initState() {
    super.initState();
    _bloc.add(GetStudent());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (context) => _bloc,
            child: BlocBuilder(
              bloc: _bloc,
              builder: (context, state) {
                if (state is FetchError) {
                  return const Center(child: Text("Error"));
                }

                if (state is FetchSuccess) {
                  return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Card(
                            margin: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(bottom: 16.0),
                                  child: const CircleAvatar(
                                    radius: 80,
                                    backgroundImage: AssetImage(
                                        "assets/img/policard-wt-sf.png"),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                const Text(
                                  'Universidad Politecnica de Tapachula',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.green),
                                  textAlign: TextAlign.center,
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 20.0)),
                                Text(
                                  '${state.student[0].name} ${state.student[0].lastname}',
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 20.0)),
                                Text(
                                  state.student[0].enrolment,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 20.0)),
                                Text(
                                  '${state.student[0].grade}',
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 20.0)),
                                Text(
                                  state
                                      .student[0].careersData![index].nameCareer,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 20.0)),
                                Text(
                                  state.student[0].birthdate,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 20.0)),
                                const Text(
                                  "Alergias : ",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.deepPurple),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 5.0)),
                                Text(
                                  '${state.student[0].emergencyData![index].allergy == "no one" ? "No hay alergias" : state.student[0].emergencyData![index].allergy}'
                                  ' ${state.student[0].emergencyData![0].allergy2 == "no one" ? "" : state.student[0].emergencyData![index].allergy2}',
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 20.0)),
                                const Text(
                                  "Tipo de sangre :",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.deepPurple),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 5.0)),
                                Text(
                                  state.student[0].emergencyData![index]
                                      .bloodType,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 15.0)),
                                const Text(
                                  "Contacto de emergencia :",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.deepPurple),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 5.0)),
                                Text(
                                  state.student[0].emergencyData![index]
                                      .emergencyName,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 20.0)),
                                const Text(
                                  "Numero de emergencia :",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.deepPurple),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 5.0)),
                                Text(
                                  state.student[0].emergencyData![index]
                                      .emergencyPhone,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 20.0)),
                                const Text(
                                  "Numero de emergencia 2:",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.deepPurple),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 5.0)),
                                Text(
                                  state.student[0].emergencyData![index]
                                          .emergencyPhone2 ??
                                      "",
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 20.0)),
                              ],
                            ));
                      });
                }
                return const Center(child: CircularProgressIndicator());
              },
            )));
  }
}
