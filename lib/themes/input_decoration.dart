import 'package:contact_list/utils/app_color.dart';
import 'package:flutter/material.dart';

InputDecorationTheme getInputDecorationTheme() => InputDecorationTheme(
      hintStyle: const TextStyle(
        color: Colors.grey,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          width: 1.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          width: 1.0,
          color: AppColor.black, // Set the enabled border color here
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          width: 1.0,
          color: AppColor.themeColor, // Set the focused border color here
        ),
      ),
    );
