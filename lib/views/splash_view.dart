
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:weather_alarm_app/views/home_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    animationController.forward();

    animationController.addListener(() {
      if (animationController.isCompleted) {
        Future.delayed(const Duration(seconds: 2
        ), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeView()),
          );
        });
      }
    });
  }

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
          child: Lottie.asset(
        'assets/lottie/weatherApp.json'
          
           ,
             controller: animationController,
             onLoaded: (composition) {
               animationController.duration = composition.duration;
             },
           ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}