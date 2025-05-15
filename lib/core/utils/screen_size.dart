import 'package:flutter/widgets.dart';

class ScreenSize {
  double deviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  double deviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
