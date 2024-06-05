import 'package:contact_list/themes/app_bar.dart';
import 'package:contact_list/themes/elevated_button.dart';
import 'package:contact_list/themes/input_decoration.dart';
import 'package:contact_list/utils/app_route.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.splashScreen,
      onGenerateRoute: AppRoute.generateRoute,
      theme: ThemeData(
        appBarTheme: getAppBarTheme(),
        inputDecorationTheme: getInputDecorationTheme(),
        elevatedButtonTheme: getElevatedButtonThemeData(),
      ),
    );
  }
}
