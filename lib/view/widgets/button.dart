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
            color: Colors.green,
            onPressed: widget.onPressed,
            child: Text(
              widget.text,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.2),
              borderSide: const BorderSide(color: Colors.green, width: 1.6),
            )));
  }
}
