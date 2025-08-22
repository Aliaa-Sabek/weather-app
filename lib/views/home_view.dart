import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_alarm_app/constant/widgets/logo_app.dart';
import 'package:weather_alarm_app/constant/widgets/search_icon.dart';
import 'package:weather_alarm_app/cubit/get_weather_cubit.dart';
import 'package:weather_alarm_app/cubit/get_weather_states.dart';
import 'package:weather_alarm_app/widgets/noResult.dart';
import 'package:weather_alarm_app/widgets/no_weatherBody.dart';
import 'package:weather_alarm_app/widgets/weatherInfoBody.dart';
import 'package:weather_alarm_app/widgets/weatherLoading.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LogoApp(),
         actions: [
           const SearchIcon(),
         ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return NoWeatherBody();
          } else if (state is WeatherLoadingState) {
            return WeatherLoading();
          } else if (state is WeatherSuccessState) {
            return WeatherInfoBody();
          } else {
            return NoResult();
          }
        },
      ),
    );
  }
}







