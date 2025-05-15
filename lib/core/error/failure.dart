import 'package:weather_app/core/utils/app_strings.dart';

class Failure {
  final String error;
  Failure([this.error = AppString.internalServerError]);
}
