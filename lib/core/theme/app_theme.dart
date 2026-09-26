  import 'package:flutter/material.dart';
import 'package:untitled10/core/theme/app_colors.dart';

ThemeData get  darkTheme => ThemeData();
ThemeData get lightTheme => ThemeData(
  scaffoldBackgroundColor:AppColors.backgroundScaffold,
  appBarTheme: AppBarTheme(backgroundColor: AppColors.backgroundScaffold,
      actionsPadding: EdgeInsets.all(20),),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(       showUnselectedLabels: true,
    unselectedItemColor: AppColors.natural,
    selectedItemColor: AppColors.primary,),
  chipTheme: ChipThemeData(side: BorderSide(color: Colors.white)),
  progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColors.primary)
);