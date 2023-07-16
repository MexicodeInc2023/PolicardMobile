import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:policard_mobile/base/api_base.dart';
import 'package:policard_mobile/blocs/fetch_bloc/fetch_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Credential extends StatefulWidget {
  const Credential({super.key});

  @override
  State<Credential> createState() => _CredentialState();
}

class _CredentialState extends State<Credential> {
  final ApiBase _base = ApiBase();
  final Fetchbloc _bloc = Fetchbloc();
  /* Ubicación */
  Position? _currentPosition;
  String? _city;
  String? _state;
  String? _country;

  @override
  void initState() {
    super.initState();
    _bloc.add(GetStudent());
    _getCurrentLocation();
  }

  /* Obtenemos la ubicación */
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verificar si el servicio de ubicación está habilitado
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Servicio de ubicación deshabilitado');
      return;
    }

    // Verificar y solicitar permiso de ubicación
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Permiso de ubicación denegado');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('Permiso de ubicación denegado para siempre :(');
      return;
    }

    // Obtener la ubicación actual
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    if (mounted) {
      setState(() {
        _currentPosition = position;
      });
    }

    // Obtener el nombre de la ubicación (ciudad, estado, etc.)
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    if (mounted) {
      setState(() {
        _country = placemarks.first.country;
        _city = placemarks.first.locality;
        _state = placemarks.first.administrativeArea;
      });
    }
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
                                  state.student[0].careersData![index]
                                      .nameCareer,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(top: 20.0)),
                                Text(
                                  _city != null && _state != null
                                      ? '$_city, $_state, $_country' // Mostrar ciudad y estado si están disponibles
                                      : 'Ubicación no disponible',
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
                              ],
                            ));
                      });
                }
                return const Center(child: CircularProgressIndicator());
              },
            )));
  }
}
