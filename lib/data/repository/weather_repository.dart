import 'dart:async';
import 'dart:convert';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app/core/error/failure.dart';
import 'package:weather_app/core/locators/locator.dart';
import 'package:weather_app/core/utils/app_strings.dart';
import 'package:weather_app/features/home/model/weather_model.dart';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

abstract interface class IWeatherRepository {
  Future<Either<Failure, WeatherModel>> getWeather({
    required double lat,
    required double lon,
  });
}

class WeatherRepository extends IWeatherRepository {
  @override
  Future<Either<Failure, WeatherModel>> getWeather({
    required double lat,
    required double lon,
  }) async {
    final InternetConnectionChecker internet =
        locator<InternetConnectionChecker>();

    final uri = Uri.parse(AppString.baseUrl).replace(
      queryParameters: {
        "lat": lat.toString(),
        "lon": lon.toString(),
        "appid": AppString.apiKey,
      },
    );

    try {
      if (await internet.hasConnection) {
        final http.Response res = await http.get(
          uri,
          headers: {'Content-Type': 'application/json'},
        );

        if (res.statusCode == 200) {
          final jsonData = json.decode(res.body);

          return right(WeatherModel.fromJson(jsonData));
        } else {
          return left(Failure());
        }
      } else {
        return left(Failure(AppString.noInternet));
      }
    } on TimeoutException catch (error) {
      return left(Failure(error.toString()));
    }
  }
}
