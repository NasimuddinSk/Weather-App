import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/locators/locator.dart';
import 'package:weather_app/core/permission/location_permission.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/features/home/cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  // Future<Position> getPermission() async {
  //   bool serviceEnable = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnable) {
  //     await Geolocator.openAppSettings();
  //     await Geolocator.requestPermission();
  //   }

  //   LocationPermission permition = await Geolocator.checkPermission();

  //   if (permition == LocationPermission.denied) {
  //     await Geolocator.requestPermission();
  //   }
  //   if (permition == LocationPermission.deniedForever) {
  //     await Geolocator.openAppSettings();
  //     await Geolocator.requestPermission();
  //   }

  //   Position position = await Geolocator.getCurrentPosition(
  //     locationSettings: LocationSettings(accuracy: LocationAccuracy.high),
  //   );
  //   return position;
  // }

  final WeatherRepository _weatherRepository = locator<WeatherRepository>();

  Future<void> getWeather() async {
    emit(WeatherLoading());

    final Position position = await getPermission();
    if (position.latitude.isNaN) {
      await getPermission();
    } else {
      final res = await _weatherRepository.getWeather(
        lat: position.latitude,
        lon: position.longitude,
      );
      res.fold(
        (error) => emit(WeatherError(error: error.error)),
        (result) => emit(WeatherSuccess(weatherModel: result)),
      );
    }
  }
}
