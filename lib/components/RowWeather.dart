// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:news/models/WeatherModel.dart';


class RowWeather extends StatelessWidget {
  const RowWeather({super.key});
 

  @override
  Widget build(BuildContext context) {
    var weatherModel= BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        WeatherModel(
            time: weatherModel[0].time,
            icon: weatherModel[0].icon,
            temp: weatherModel[0].temp),
        WeatherModel(
            time: weatherModel[1].time,
            icon: weatherModel[1].icon,
            temp: weatherModel[1].temp),
        WeatherModel(
            time: weatherModel[2].time,
            icon: weatherModel[2].icon,
            temp: weatherModel[2].temp),
        WeatherModel(
            time: weatherModel[3].time,
            icon: weatherModel[3].icon,
            temp: weatherModel[3].temp),
      ],
    );
  }
}
