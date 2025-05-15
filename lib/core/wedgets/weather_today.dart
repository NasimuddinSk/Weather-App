import 'package:flutter/material.dart';
import 'package:weather_app/core/locators/locator.dart';
import 'package:weather_app/core/utils/app_color.dart';
import 'package:weather_app/core/utils/screen_size.dart';

final ScreenSize _screenSize = locator<ScreenSize>();

Row weatherTodayTomorrow({
  required BuildContext context,
  required String day,
  required String up,
  required String down,
}) {
  return Row(
    spacing: 5,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(day, style: Theme.of(context).textTheme.bodySmall),
      SizedBox(width: _screenSize.deviceWidth(context) * .004),
      Row(
        children: [
          Icon(Icons.arrow_upward_rounded, color: AppColor.white, size: 15),
          Text(
            up,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      SizedBox(width: _screenSize.deviceWidth(context) * .004),
      Row(
        children: [
          Icon(Icons.arrow_downward_rounded, color: AppColor.white, size: 15),
          Text(
            down,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ],
  );
}
