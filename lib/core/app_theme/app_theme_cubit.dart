import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  static final ThemeData _lightTheme = ThemeData.light();
  static final ThemeData _darkTheme = ThemeData.dark();
  AppThemeCubit() : super(AppThemeState(_darkTheme));

  void toggleTheme(bool isDark){
    print(isDark);
    final themeData = isDark?_darkTheme:_lightTheme;
    emit(AppThemeState(themeData));
    _saveTheme(isDark);
  }

  Future<void> _saveTheme(bool isDark) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('isDark', isDark);
  }

  Future<bool> _loadTheme() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool('isDark')??false;
  }

  Future<void> setInitialTheme() async {
    final isDark = await _loadTheme();
    final themeData = isDark?_darkTheme:_lightTheme;
    emit(AppThemeState(themeData));
  }

}
