import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  
  final Icon icon;
  final VoidCallback action;

  const RoundedButton({Key? key,required this.icon, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      child: icon,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
        primary: Colors.yellow,
        onPrimary: Colors.black,
      ),
    );
  }
}