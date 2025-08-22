import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WeatherLoading extends StatelessWidget {
  const WeatherLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
            colors: [
                Colors.blueGrey,
                Colors.white70,
                Colors.lightBlue.shade200,



              ],
         )),
       child: Center(
            child: LottieBuilder.asset(
        'assets/lottie/loading.json',
          height: 400,
          width: 400,
       )),
      ),
      );
  }
}
