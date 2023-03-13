import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? obscure;
  const CustomTextField({super.key, this.controller, this.obscure});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool obsc = widget.obscure ?? false;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: widget.controller,
      obscureText: obsc,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.5),
          borderSide:const BorderSide(color: Colors.indigo, width: 1.6),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.5),
          borderSide:const BorderSide(color: Colors.indigo, width: 1.6),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.5),
          borderSide:const BorderSide(color: Colors.indigoAccent, width: 1.6),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.5),
          borderSide:const BorderSide(color: Colors.redAccent, width: 1.6),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.5),
          borderSide:const BorderSide(color: Colors.white10, width: 1.6),
        ),
      ),
    );
  }
}