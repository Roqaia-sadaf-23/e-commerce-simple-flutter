import 'package:flutter/material.dart';

class Custumtexttitleauth extends StatelessWidget {
  final String texttitle;
  const Custumtexttitleauth({super.key, required this.texttitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      texttitle,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
