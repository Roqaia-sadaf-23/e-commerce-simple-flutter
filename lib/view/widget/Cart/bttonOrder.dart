import 'package:flutter/material.dart';

class Custumbottuncart extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final Color? backcolor;
  const Custumbottuncart({super.key, required this.textbutton, this.onPressed, this.backcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
    
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor:backcolor),
        onPressed: onPressed,
        child: Text(textbutton, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
