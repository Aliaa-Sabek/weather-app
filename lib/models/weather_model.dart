class WeatherModel {
  final String cityName;
  final DateTime date;
  final double temp;
  final double maxTemp, maxTempDay2, maxTempDay3;
  final double minTemp, minTempDay2, minTempDay3;
  final String weatherCondition,
      weatherConditionDay1,
      weatherConditionDay2,
      weatherConditionDay3;
  final String? image, imageDay2, imageDay3;
  final int humidityDay1, humidityDay2, humidityDay3;
  final double windSpeedDay1, windSpeedDay2, windSpeedDay3;

  WeatherModel({
    required this.cityName,
    required this.date,
    this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
    required this.humidityDay1,
    required this.humidityDay2,
    required this.humidityDay3,
    required this.weatherConditionDay1,
    required this.imageDay2,
    required this.maxTempDay2,
    required this.minTempDay2,
    required this.weatherConditionDay2,
    required this.imageDay3,
    required this.maxTempDay3,
    required this.minTempDay3,
    required this.weatherConditionDay3,
    required this.windSpeedDay1,
    required this.windSpeedDay2,
    required this.windSpeedDay3,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['current']['temp_c'],
      weatherCondition: json['current']['condition']['text'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      weatherConditionDay1: json['forecast']['forecastday'][0]['day']
          ['condition']['text'],
      weatherConditionDay2: json['forecast']['forecastday'][1]['day']
          ['condition']['text'],
      weatherConditionDay3: json['forecast']['forecastday'][2]['day']
          ['condition']['text'],
      maxTempDay2: json['forecast']['forecastday'][1]['day']['avgtemp_c'],
      minTempDay2: json['forecast']['forecastday'][1]['day']['mintemp_c'],
      maxTempDay3: json['forecast']['forecastday'][2]['day']['avgtemp_c'],
      minTempDay3: json['forecast']['forecastday'][2]['day']['mintemp_c'],
      imageDay2: json['forecast']['forecastday'][1]['day']['condition']['icon'],
      imageDay3: json['forecast']['forecastday'][2]['day']['condition']['icon'],
      humidityDay1: json['forecast']['forecastday'][0]['day']['avghumidity'],
      humidityDay2: json['forecast']['forecastday'][1]['day']['avghumidity'],
      humidityDay3: json['forecast']['forecastday'][2]['day']['avghumidity'],
      windSpeedDay1: json['forecast']['forecastday'][0]['day']['maxwind_mph'],
      windSpeedDay2: json['forecast']['forecastday'][1]['day']['maxwind_mph'],
      windSpeedDay3: json['forecast']['forecastday'][2]['day']['maxwind_mph'],
    );
  }
}