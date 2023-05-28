import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:policard_mobile/blocs/auth_bloc/auth_bloc.dart';
import 'package:policard_mobile/repository/repo_auth.dart';
import 'package:policard_mobile/view/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => AuthBloc(AuthRepo()))],
        child: const MaterialApp(
          home: Login(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
