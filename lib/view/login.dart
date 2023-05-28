import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:policard_mobile/blocs/auth_bloc/auth_bloc.dart';
import 'package:policard_mobile/view/home.dart';
import 'package:policard_mobile/view/widgets/button.dart';
import 'package:policard_mobile/view/widgets/custom_textfield.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthBloc? _authBloc;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 170, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Image(
              image: AssetImage("assets/img/policard-wt-sf.png"),
              width: 200,
              height: 200,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
            const Center(
                child:  Text(
            "Iniciar Sesion ",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff5259f5),
              fontSize: 34,
              fontFamily: "Inter",
              fontWeight: FontWeight.w800,
        ),
    ),),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Email",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold),
            ),
            CustomTextField(
              controller: email,
              obscure: false,
            ),
            const SizedBox(
              height: 21,
            ),
            const Text(
              "Constraseña",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold),
            ),
            CustomTextField(
              controller: password,
              obscure: true,
            ),
            const SizedBox(
              height: 21,
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthLoading) {
                  const Center(
                      child: CircularProgressIndicator(
                    color: Colors.indigo,
                  ));
                } else if (state is AuthSuccessful) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Inicio de sesión exitoso"),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else if (state is AuthFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Error al iniciar sesión"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Button(
                onPressed: () {
                  _authBloc!.add(
                      LoginEvent(email: email.text, password: password.text));
                },
                text: "Login",
              ),
            )
          ],
        ),
      ),
    );
  }
}
