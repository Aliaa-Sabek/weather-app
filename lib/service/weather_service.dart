import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_alarm_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '70000001cdc44a48a3a221902251908'; 
  WeatherServices(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=10',
      );

      
      log('Status Code: ${response.statusCode}');
      log('Response Data: ${response.data.toString()}');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      
      final statusCode = e.response?.statusCode;
      final errorData = e.response?.data;

      if (statusCode == 400 && errorData != null) {
        final String errorMessage =
            errorData['error']['message'] ?? 'City not found';
        throw Exception('Error: $errorMessage');
      } else if (statusCode == 401) {
        throw Exception('Error: Invalid API key ❌');
      } else {
        throw Exception(
            'Error: ${errorData?['error']['message'] ?? 'Unknown error'}');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('opps! there was an error, try again later');
    }
  }
}
