import 'package:flutter/material.dart';

class Custumtextbodyauth extends StatelessWidget {
  final String text;
  const Custumtextbodyauth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
