

import 'package:flutter/material.dart';

import 'package:weather_alarm_app/widgets/itemDaily.dart';


class dailyForeCastWidget extends StatelessWidget {
  final String dayNumber, dayImage, dayWeatherCondition, dayDate;
  final double dayMaxTemp, dayMinTemp, dayWindSpeed;
  final int dayHumidity;
  const dailyForeCastWidget({
    Key? key,
    required this.dayNumber,
    required this.dayImage,
    required this.dayWeatherCondition,
    required this.dayMaxTemp,
    required this.dayMinTemp,
    required this.dayWindSpeed,
    required this.dayHumidity,
    required this.dayDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(15),
   
      
      
      child: Column(
        children: [
          Text(
            'Day $dayNumber',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          ListTile(
              leading: Image.network(
                'https:${dayImage}',
                height: 40,
                width: 40,
              ),
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${dayDate}\n',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: '${dayWeatherCondition}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )),
          ItemDaily(
            title: 'Max Temperature',
            subTitle: '${dayMaxTemp.round()}°C',
            image: 'assets/images/hot.png',
          ),
          ItemDaily(
            title: 'Min Temperature',
            subTitle: '${dayMinTemp.round()}°C',
            image: 'assets/images/temperature.png',
          ),
          ItemDaily(
            title: 'Humidity',
            subTitle: '${dayHumidity}°C',
            image: 'assets/images/humidity.png',
          ),
          ItemDaily(
            title: 'Wind Speed',
            subTitle: '${dayWindSpeed.round()}°C',
            image: 'assets/images/windSpeed.png',
          ),
        ],
      ),
    );
  }
}
