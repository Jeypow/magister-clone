import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF234E98),
            const Color(0xFF1D3060),
          ],
        ),
      ),
      child: Center(
          child: SpinKitRotatingCircle(
        color: Colors.white,
        size: 50.0,
      )),
    );
  }
}
