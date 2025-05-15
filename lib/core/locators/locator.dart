import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app/core/utils/screen_size.dart';
import 'package:weather_app/data/repository/weather_repository.dart';

final locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton<ScreenSize>(() => ScreenSize());

  locator.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker.createInstance(),
  );
  locator.registerLazySingleton<WeatherRepository>(() => WeatherRepository());
}
