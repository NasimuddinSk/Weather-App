import 'dart:convert';

// Helper function to parse the root JSON string
WeatherModel? weatherModelFromJson(String str) {
  final jsonData = json.decode(str);
  if (jsonData == null) return null;
  return WeatherModel.fromJson(jsonData);
}

String? weatherModelToJson(WeatherModel? data) {
  if (data == null) return null;
  return json.encode(data.toJson());
}

class WeatherModel {
  final List<ForecastItem>? list; // List itself can be null
  final City? city;

  WeatherModel({this.list, this.city});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    list:
        json["list"] == null
            ? null
            : List<ForecastItem>.from(
              (json["list"] as List<dynamic>).map(
                (x) => ForecastItem.fromJson(x as Map<String, dynamic>),
              ),
            ),
    city:
        json["city"] == null
            ? null
            : City.fromJson(json["city"] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    "list":
        list == null ? null : List<dynamic>.from(list!.map((x) => x.toJson())),
    "city": city?.toJson(),
  };
}

class City {
  final String? name;
  final String? country;
  final int? sunrise;
  final int? sunset;

  City({this.name, this.country, this.sunrise, this.sunset});

  factory City.fromJson(Map<String, dynamic> json) => City(
    name: json["name"] as String?,

    country: json["country"] as String?,
    sunrise: json["sunrise"] as int?,
    sunset: json["sunset"] as int?,
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "country": country,
    "sunrise": sunrise,
    "sunset": sunset,
  };
}

class ForecastItem {
  final int? dt;
  final MainData? main;
  final List<WeatherInfo>? weather; // List itself can be null
  final Clouds? clouds;

  ForecastItem({this.dt, this.main, this.weather, this.clouds});

  factory ForecastItem.fromJson(Map<String, dynamic> json) => ForecastItem(
    dt: json["dt"] as int?,
    main:
        json["main"] == null
            ? null
            : MainData.fromJson(json["main"] as Map<String, dynamic>),
    weather:
        json["weather"] == null
            ? null
            : List<WeatherInfo>.from(
              (json["weather"] as List<dynamic>).map(
                (x) => WeatherInfo.fromJson(x as Map<String, dynamic>),
              ),
            ),
    clouds:
        json["clouds"] == null
            ? null
            : Clouds.fromJson(json["clouds"] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    "dt": dt,
    "main": main?.toJson(),
    "weather":
        weather == null
            ? null
            : List<dynamic>.from(weather!.map((x) => x.toJson())),
    "clouds": clouds?.toJson(),
  };
}

class Clouds {
  final int? all;

  Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) =>
      Clouds(all: json["all"] as int?);

  Map<String, dynamic> toJson() => {"all": all};
}

class MainData {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? humidity;
  final double? tempKf;

  MainData({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.humidity,
    this.tempKf,
  });

  factory MainData.fromJson(Map<String, dynamic> json) => MainData(
    temp: (json["temp"] as num?)?.toDouble(),
    feelsLike: (json["feels_like"] as num?)?.toDouble(),
    tempMin: (json["temp_min"] as num?)?.toDouble(),
    tempMax: (json["temp_max"] as num?)?.toDouble(),
    humidity: json["humidity"] as int?,
    tempKf: (json["temp_kf"] as num?)?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "feels_like": feelsLike,
    "temp_min": tempMin,
    "temp_max": tempMax,
    "humidity": humidity,
    "temp_kf": tempKf,
  };
}

class WeatherInfo {
  final String? main;
  final String? icon;

  WeatherInfo({this.main, this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) =>
      WeatherInfo(main: json["main"] as String?, icon: json["icon"] as String?);

  Map<String, dynamic> toJson() => {"main": main, "icon": icon};
}
