import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:weather_app/core/locators/locator.dart';
import 'package:weather_app/core/utils/app_color.dart';
import 'package:weather_app/features/home/cubit/weather_cubit.dart';
import 'package:weather_app/features/home/page/home_page.dart';

import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: AppColor.transparent),
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => WeatherCubit())],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                AppColor.primary,
                const Color.fromARGB(153, 1, 142, 177),
              ],
            ),
          ),
          child: child,
        );
      },
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
