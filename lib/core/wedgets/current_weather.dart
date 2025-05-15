import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/image_url.dart';

Widget currentWeather(BuildContext context) {
  return Expanded(
    child: Stack(
      children: [
        Positioned(
          top: 15,
          child: Row(
            children: [
              SizedBox(width: 25),
              Text(
                "Today, May 07 5:10AM",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        Positioned(
          left: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "16°",
                style: TextStyle(fontSize: 120, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Positioned(
          right: 35,
          child: Row(
            children: [
              SizedBox(
                child: Transform.rotate(
                  alignment: Alignment.centerRight,
                  angle: pi * -2.5,
                  child: Row(
                    spacing: 10,
                    children: [
                      Image.asset(
                        "${ImageUrl.baseImageUrl}09d.png",
                        width: 25,
                        height: 25,
                      ),
                      Text(
                        "Mostly Cloudy",
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
