import 'package:flutter/material.dart';
import 'package:testproject/core/constant/colors.dart';

class Customtextsignuporsignin extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;
  const Customtextsignuporsignin({
    super.key,
    required this.textone,
    required this.texttwo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone, style: Theme.of(context).textTheme.bodySmall),
        InkWell(
          onTap: onTap,
          child: Text(
            texttwo,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Appcolor.primarycolor),
          ),
        ),
      ],
    );
  }
}
