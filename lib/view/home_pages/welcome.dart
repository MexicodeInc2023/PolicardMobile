import 'package:flutter/material.dart';
import 'package:policard_mobile/view/login.dart';
import 'package:policard_mobile/view/widgets/button.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
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
                    child: Text(
                  "Bienvenido a PoliCard",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold),
                )),
                const SizedBox(
                  height: 40,
                ),
                Button(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  text: "Cerrar Sesión",
                ),
              ])),
    );
  }
}
