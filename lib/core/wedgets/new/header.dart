import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/app_color.dart';

Padding header(BuildContext context, String cityName) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Row(
        children: [
          Icon(Icons.location_on_sharp, color: AppColor.white),
          Text(
            cityName,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(overflow: TextOverflow.clip),
          ),
        ],
      ),
    ),
  );
}
