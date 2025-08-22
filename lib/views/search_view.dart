
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_alarm_app/cubit/get_weather_cubit.dart';



class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/weather-app.png',height: 40,width: 40,),
        ),

      ),
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

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(

              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                onSubmitted: (value) async {
                  var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                  getWeatherCubit.getWeather(cityName: value);
                  Navigator.of(context).pop();
                },
               decoration: InputDecoration(
                 hintText: "Enter city name",
                 labelText: "Search",
                    
                 suffixIcon: Icon(Icons.search),
                 border: OutlineInputBorder(),
                  contentPadding:
                   EdgeInsets.symmetric(vertical: 32, horizontal: 18)),
              ),
     ),
  LottieBuilder.asset('assets/lottie/searcheWeather.json',

     height: 200,
 width: 200,
 )
     ],
        ),
      ),
    );
  }
}

