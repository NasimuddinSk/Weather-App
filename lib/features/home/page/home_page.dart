import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:weather_app/core/permission/location_permission.dart';
import 'package:weather_app/core/utils/app_color.dart';
import 'package:weather_app/core/utils/image_url.dart';
import 'package:weather_app/core/utils/screen_size.dart';
import 'package:weather_app/core/utils/time_formatter.dart';
import 'package:weather_app/core/wedgets/new/header.dart';
import 'package:weather_app/core/wedgets/weather_today.dart';
import 'package:weather_app/features/home/cubit/weather_cubit.dart';
import 'package:weather_app/features/home/cubit/weather_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getPermission();
    context.read<WeatherCubit>().getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherSuccess) {
            return LiquidPullToRefresh(
              showChildOpacityTransition: false,
              onRefresh: () => context.read<WeatherCubit>().getWeather(),
              child: ListView(
                children: [
                  Column(
                    children: [
                      header(
                        context,
                        "${state.weatherModel.city!.name},${state.weatherModel.city!.country}",
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            timeFormatter(),
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall!.copyWith(fontSize: 12),
                          ),
                        ),
                      ),

                      weatherDetails(
                        context: context,

                        weatherCon:
                            state
                                .weatherModel
                                .list
                                ?.first
                                .weather
                                ?.first
                                .main ??
                            "",

                        icon:
                            state
                                .weatherModel
                                .list
                                ?.first
                                .weather
                                ?.first
                                .icon ??
                            "",

                        value: (state.weatherModel.list!.first.main!.temp! -
                                273.15)
                            .toStringAsFixed(0),
                        size: ScreenSize().deviceWidth(context) * .4,
                      ),

                      todayYesterdayDetails(
                        context: context,
                        minTemp: (state
                                    .weatherModel
                                    .list!
                                    .first
                                    .main!
                                    .tempMax! -
                                273.15)
                            .toStringAsFixed(0),
                        maxTemp: (state
                                    .weatherModel
                                    .list!
                                    .first
                                    .main!
                                    .tempMin! -
                                273.15)
                            .toStringAsFixed(0),
                        feelLike: (state
                                    .weatherModel
                                    .list!
                                    .first
                                    .main!
                                    .feelsLike! -
                                273.15)
                            .toStringAsFixed(0),
                      ),
                      SizedBox(height: 40),
                      moreDetailsRow(
                        context: context,
                        sunRise: state.weatherModel.city!.sunrise!,
                        sunSet: state.weatherModel.city!.sunset!,
                        humanity:
                            state.weatherModel.list!.first.main!.humidity
                                .toString(),
                      ),

                      SizedBox(height: 40),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(17, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 2, color: Colors.white38),
                        ),
                        width: ScreenSize().deviceWidth(context) * .95,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hourly Forecast",
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall!.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height:
                                  ScreenSize().isLandscape(context)
                                      ? ScreenSize().deviceWidth(context) * .4
                                      : ScreenSize().deviceHeight(context) *
                                          .25,
                              // adjust height as needed
                              child: ListView.builder(
                                scrollDirection:
                                    Axis.horizontal, // if horizontal scrolling is intended
                                itemCount: state.weatherModel.list!.length,
                                itemBuilder: (context, index) {
                                  final String imageUrl =
                                      "${ImageUrl.baseImageUrl}${state.weatherModel.list![index].weather!.first.icon}.png";

                                  final String defaultImageUrl =
                                      "${ImageUrl.baseImageUrl}01d.png";

                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        formatMonthDay(
                                          unixTimestamp:
                                              state
                                                  .weatherModel
                                                  .list![index]
                                                  .dt!,
                                        ),
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall!.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: AppColor.white.withAlpha(150),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                29,
                                                255,
                                                255,
                                                255,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            width: 50, // for horizontal layout
                                            height: 50,
                                            child: Image.asset(
                                              imageUrl.isEmpty
                                                  ? defaultImageUrl
                                                  : imageUrl,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        timeFormatter(
                                          unixTimestamp:
                                              state
                                                  .weatherModel
                                                  .list![index]
                                                  .dt,
                                          isTime: true,
                                        ),
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall!.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: AppColor.white.withAlpha(150),
                                        ),
                                      ),
                                      Text(
                                        "${(state.weatherModel.list![index].main!.temp! - 273.15).toStringAsFixed(0)}°",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall!.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 25,
                                          color: AppColor.white.withAlpha(150),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ],
              ),
            );
          }
          if (state is WeatherLoading) {
            return Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is WeatherError) {
            return Center(
              child: ShaderMask(
                shaderCallback:
                    (bounds) => LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topRight,
                      colors: [
                        const Color.fromARGB(255, 226, 58, 45),
                        const Color.fromARGB(255, 153, 0, 26),
                      ],
                    ).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                child: Text(
                  state.error,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  Container moreDetailsRow({
    required BuildContext context,
    required int sunRise,
    required int sunSet,
    required String humanity,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(17, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2, color: Colors.white38),
      ),
      width: ScreenSize().deviceWidth(context) * .95,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          moreDetails(
            context,
            value: timeFormatter(unixTimestamp: sunRise, isTime: true),
          ),
          SizedBox(
            height: 20,
            child: VerticalDivider(thickness: 2, color: Colors.white38),
          ),
          moreDetails(
            context,
            title: "Sunset",
            value: timeFormatter(unixTimestamp: sunSet, isTime: true),
            icon: Icons.sunny_snowing,
          ),
          SizedBox(
            height: 20,
            child: VerticalDivider(thickness: 2, color: Colors.white38),
          ),
          moreDetails(
            context,
            title: "Humidity",
            value: "$humanity%",
            icon: Icons.water_drop_rounded,
          ),
        ],
      ),
    );
  }

  Column moreDetails(
    BuildContext context, {
    String? title,
    String? value,
    IconData? icon,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          spacing: 5,
          children: [
            Icon(icon ?? Icons.sunny, color: AppColor.white, size: 20),
            Text(
              value ?? "07:00 AM",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text(
          overflow: TextOverflow.ellipsis,
          title ?? "Sunrise",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 15),
        ),
      ],
    );
  }

  Container todayYesterdayDetails({
    required BuildContext context,
    required String maxTemp,
    required String minTemp,
    required String feelLike,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(17, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2, color: Colors.white38),
      ),
      width: ScreenSize().deviceWidth(context) * .95,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          weatherTodayTomorrow(
            context: context,
            day: "Today",
            up: "$maxTemp°C",
            down: "$minTemp°C",
          ),

          SizedBox(
            height: 20,
            child: VerticalDivider(thickness: 2, color: Colors.white38),
          ),
          Row(
            children: [
              Text("Feel Like", style: Theme.of(context).textTheme.bodySmall),

              SizedBox(width: 10),

              Text(
                "$feelLike°C",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container weatherDetails({
    required BuildContext context,
    required String weatherCon,
    required String icon,
    String? value,
    double size = 50,
  }) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ShaderMask(
            shaderCallback:
                (bounds) => LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topRight,
                  colors: [
                    const Color.fromARGB(255, 226, 58, 45),
                    const Color.fromARGB(228, 0, 200, 250),
                  ],
                ).createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
            child: Text(
              value ?? "No Data!",
              style: TextStyle(fontSize: 150, fontWeight: FontWeight.w400),
            ),
          ),

          SizedBox(
            height: 130,
            child: Text(
              value == null ? "" : "°C",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.normal,
                color: AppColor.white.withAlpha(150),
              ),
            ),
          ),
          Spacer(),
          Transform.rotate(
            angle: pi / -2,
            child: Container(
              margin: EdgeInsets.only(
                top: ScreenSize().deviceWidth(context) * .08,
              ),
              child: Row(
                spacing: 10,
                children: [
                  Image.asset(
                    "${ImageUrl.baseImageUrl + icon}.png",
                    width: 40,
                    height: 40,
                  ),
                  Text(
                    weatherCon,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
