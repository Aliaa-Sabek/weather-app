
import 'package:flutter/material.dart';

class DayForecast extends StatelessWidget {
  final String day, dayCondition, dayImage;
  final double dayMaxTemp, dayMinTemp;

  const DayForecast({
    Key? key,
    required this.day,
    required this.dayCondition,
    required this.dayMaxTemp,
    required this.dayMinTemp,
    required this.dayImage,
  }) : super(key: key);

  // final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        'https:${dayImage}',
        height: 30,
        width: 30,
      ),
      title: Text(day),
      subtitle: Text('${dayCondition}'),
      trailing: Text('${dayMaxTemp.round()}°C / ${dayMinTemp.round()}°C'),
    );
  }
}
