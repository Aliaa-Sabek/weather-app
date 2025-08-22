
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoResult extends StatelessWidget {
  const NoResult({Key? key}) : super(key: key);

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
            )
        ),

        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        LottieBuilder.asset(
          'assets/lottie/noResult.json',
        repeat: false,
        ),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 35.0,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold
              ),
              child: AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  TypewriterAnimatedText('OPPs'),
                  TypewriterAnimatedText('There is No Result '),
                  TypewriterAnimatedText('Search Again'),
                ],
              ),
            ),
          ],
        )

      ),
    );

  }
}
