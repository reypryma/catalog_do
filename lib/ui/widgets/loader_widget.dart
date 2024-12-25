import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoaderWidget extends StatelessWidget {
  final Color color;
  const LoaderWidget({super.key, required this.color});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150,
        height: 150,
        child: SpinKitRing(
          color: color,
          size: 50,
        ),
      ),
    );
  }
}