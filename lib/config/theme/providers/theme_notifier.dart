import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier(this._prefs) : super(ThemeMode.system) {
    _initThemeMode();
  }

  final SharedPreferences _prefs;

  void _initThemeMode() {
    final isDarkMode = _prefs.getBool(AppKeys.isDarkMode) ?? false;
    state = _getTheme(isDarkMode);
  }

  void changeTheme(bool isDarkMode) {
    state = _getTheme(isDarkMode);
    _prefs.setBool(AppKeys.isDarkMode, isDarkMode);
  }

  ThemeMode _getTheme(bool isDarkMode) {
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }
}
