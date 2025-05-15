import 'package:weather_app/features/home/model/weather_model.dart';

sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final WeatherModel weatherModel;

  WeatherSuccess({required this.weatherModel});
}

final class WeatherError extends WeatherState {
  final String error;

  WeatherError({required this.error});
}
