import 'package:contact_list/utils/app_color.dart';
import 'package:flutter/material.dart';

AppBarTheme getAppBarTheme() => const AppBarTheme(
      backgroundColor: AppColor.themeColor,
      foregroundColor: AppColor.white,
      titleTextStyle: TextStyle(
        color: AppColor.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
