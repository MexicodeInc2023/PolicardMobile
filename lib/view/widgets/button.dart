import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final Function() onPressed;
  final String text;
  const Button({required this.onPressed, required this.text, super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: 200,
        child: MaterialButton(
            color: Color(0xff00c850),
            elevation: 4, 
            onPressed: widget.onPressed,
            child: Text(
              widget.text,
              style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold ),
            ),
            
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.2),
              borderSide: const BorderSide(color: Colors.green, width: 1.6),
            )));
  }
}
