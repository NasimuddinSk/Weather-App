import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/app_color.dart';

Row appBar({required String location, required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        spacing: 5,
        children: [
          Icon(Icons.location_on, color: AppColor.white, size: 28),

          Text(location, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
      SizedBox(child: Icon(Icons.search, color: AppColor.white, size: 28)),
    ],
  );
}
