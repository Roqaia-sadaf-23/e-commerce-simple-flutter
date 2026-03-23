// ignore: file_names
import 'package:flutter/material.dart';

class Custumtextformauth extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final String labeltext;
  final IconData icon;
  final String Function(String?) valid;
  final bool isnumber;
  final bool? obscureText;
  final void Function()? ontapicon;

  const Custumtextformauth({
    super.key,
    required this.controller,
    required this.hinttext,
    required this.labeltext,
    required this.icon,
    required this.valid,
    required this.isnumber,
    this.obscureText,
    this.ontapicon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          obscureText:
              obscureText == null || obscureText == false ? false : true,
          keyboardType:
              isnumber
                  ? TextInputType.numberWithOptions(decimal: true)
                  : TextInputType.text,
          validator: valid,
          controller: controller,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 10,
            ),

            label: Container(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                labeltext,
                style: const TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            suffixIcon:
                ontapicon == null
                    ? null
                    : InkWell(onTap: ontapicon, child: Icon(icon)),
            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
      ),
    );
  }
}
