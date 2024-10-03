import 'package:news/models/WeatherModel.dart';

class WeatherState {}

class WeaherInitialState extends WeatherState {}

class WeathLoadedState extends WeatherState {
  final List<WeatherModel> weatherModel;


  WeathLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {
  final String eroor;

  WeatherFailureState({required this.eroor});
}
