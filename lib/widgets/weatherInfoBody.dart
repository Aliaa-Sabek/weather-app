import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_alarm_app/cubit/get_weather_cubit.dart';

import 'package:weather_alarm_app/models/weather_model.dart';
import 'package:weather_alarm_app/views/day_details.dart';
import 'package:weather_alarm_app/widgets/dayForecast.dart';
class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Container(
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'Time: ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https:${weatherModel.image!}',
                ),
                Text(
                  '${weatherModel.temp.round()}°C',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  '${weatherModel.weatherCondition}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/images/hot.png',
                  height: 50,
                  width: 50,
                ),
                Text(
                  'Temp Max \n${weatherModel.maxTemp.round()}°C',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  'assets/images/temperature.png',
                  height: 70,
                  width: 70,
                ),
                Text(
                  'Temp Min \n${weatherModel.minTemp.round()}°C',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Column(

        
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ForeCost for 3 Days ',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

               
                  DayForecast(
                    day: 'Day One',
                    dayImage: weatherModel.image!,
                    dayCondition: weatherModel.weatherConditionDay1,
                    dayMaxTemp: weatherModel.maxTemp,
                    dayMinTemp: weatherModel.minTemp,





                  ),
                  DayForecast(
                    day: 'Day Two',
                    dayImage: weatherModel.imageDay2!,
                    dayCondition: weatherModel.weatherConditionDay2,
                    dayMaxTemp: weatherModel.maxTempDay2,
                    dayMinTemp: weatherModel.minTempDay2,
                  ),
                  DayForecast(
                    day: 'Day Three',
                    dayImage: weatherModel.imageDay3!,
                    dayCondition: weatherModel.weatherConditionDay3,
                    dayMaxTemp: weatherModel.maxTempDay3,
                    dayMinTemp: weatherModel.minTempDay3,
                  ),
                  GestureDetector(
                    onTap: () {
                      var getWeatherCubit =
                          BlocProvider.of<GetWeatherCubit>(context);
                      getWeatherCubit.getWeather(
                          cityName: weatherModel.cityName);
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return DayDetails();
                      }));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'More Details',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Icon(
                          Icons.double_arrow_sharp,
                          size: 20,
                          color: Colors.black,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


MaterialColor getThemeColor(String? condition) {
  // ignore: unrelated_type_equality_checks
  if (condition == null) {
    return Colors.blue;
  }

  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Partly cloudy':
      return Colors.blue;
    case 'Cloudy':
    case 'Fog':
    case 'Freezing fog':
    case 'Overcast':
      return Colors.grey;

    case 'Mist':
      return Colors.indigo;
    case 'Patchy rain possible':
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Blowing snow':
    case 'Blizzard':
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Ice pellets':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
      return Colors.lightBlue;

    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.cyan;

    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.amber;

    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
    case 'Clear':
      return Colors.deepPurple;

    default:
      return Colors.blue;
  }
}

