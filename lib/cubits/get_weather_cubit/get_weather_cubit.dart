import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Services/WeatherService.dart';
import 'package:news/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:news/models/WeatherModel.dart';


class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeaherInitialState());
  late List<WeatherModel> weatherModel;

  gweWeatherData({required String cityName}) async {
    try {
      weatherModel = await Weatherservice().getTempAtDays(nameCity: cityName);
      emit(WeathLoadedState(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherFailureState(eroor: e.toString()));
    }
  }
}
