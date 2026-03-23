import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:testproject/core/class/StatusRecuest.dart';
import 'package:testproject/core/constant/imagesassent.dart';

class Handlingdataview extends StatelessWidget {
  final StatusRecuest statusRecuest;
  final Widget? widget;
  const Handlingdataview({
    super.key,
    required this.statusRecuest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRecuest == StatusRecuest.loading
        ? Center(child: Lottie.asset(Appimagesassent.loding))
        : statusRecuest == StatusRecuest.serverFailure
        ? const Center(child: Text('Server Failure'))
        : statusRecuest == StatusRecuest.offlineFailure
        ? Center(child: Lottie.asset(Appimagesassent.offline))
        : statusRecuest == StatusRecuest.failure
        ? const Center(child: Text('No Data', style: TextStyle(fontSize: 20)))
        : widget ?? const SizedBox.shrink();
  }
}
