

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_alarm_app/models/weather_model.dart';
import 'package:weather_alarm_app/widgets/dailyForecastwidget.dart';
import 'package:weather_alarm_app/widgets/weatherInfoBody.dart';

import '../constant/widgets/logo_app.dart';
import '../cubit/get_weather_cubit.dart';

class DayDetails extends StatelessWidget {
  const DayDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
    BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  LogoApp(),

      ),

      body:Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
        gradient: LinearGradient(colors: 
        [
            getThemeColor(weatherModel.weatherCondition),
             getThemeColor(weatherModel.weatherCondition)[300]!,
              getThemeColor(weatherModel.weatherCondition)[50]!,
        ] ,
        

        
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
        child: ListView(
          children: [
            dailyForeCastWidget(
              dayNumber: 'One',
              dayWeatherCondition: '${weatherModel.weatherConditionDay1}',
              dayDate: '${weatherModel.date.year} - ${weatherModel.date.month} - ${weatherModel.date.day}',
              dayImage: '${weatherModel.image}',
              dayMaxTemp: weatherModel.maxTemp,
              dayMinTemp: weatherModel.minTemp,
              dayHumidity: weatherModel.humidityDay1,
              dayWindSpeed: weatherModel.windSpeedDay1,
            ),

            dailyForeCastWidget(
              dayNumber: 'Two',
              dayWeatherCondition: '${weatherModel.weatherConditionDay2}',
              dayDate: '${weatherModel.date.year} - ${weatherModel.date.month} - ${weatherModel.date.day+1}',
              dayImage: '${weatherModel.imageDay2}',
              dayMaxTemp: weatherModel.maxTempDay2,
              dayMinTemp: weatherModel.minTempDay2,
              dayHumidity: weatherModel.humidityDay2,
              dayWindSpeed: weatherModel.windSpeedDay2,
            ),
            dailyForeCastWidget(
              dayNumber: 'Three',
              dayWeatherCondition: '${weatherModel.weatherConditionDay3}',
              dayDate: '${weatherModel.date.year} - ${weatherModel.date.month} - ${weatherModel.date.day+2}',
              dayImage: '${weatherModel.imageDay3}',
              dayMaxTemp: weatherModel.maxTempDay3,
              dayMinTemp: weatherModel.minTempDay3,
              dayHumidity: weatherModel.humidityDay3,
              dayWindSpeed: weatherModel.windSpeedDay3,
            ),


          ],
        ),
      )
    );
  }
}


//  getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (serviceEnabled == false) {
//       return;
//     }
//     permission = await Geolocator.checkPermission();

//     if (permission == LocationPermandation.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermandation.denied) print('denied');
//     }
//   }


