import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:news/pages/HomePage.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(
          )),
    );
  }
}
