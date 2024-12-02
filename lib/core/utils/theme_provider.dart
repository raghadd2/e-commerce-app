import 'package:base_project/core/network/local/shared_pref.dart';
import 'package:base_project/core/network/local/shared_pref_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider =
    NotifierProvider<ThemeProvider, ThemeMode>(() => ThemeProvider());

class ThemeProvider extends Notifier<ThemeMode> {
  @override
  build() {
    state = checkTheme();
    return state;
  }

  void changeTheme(ThemeMode themeMode) {
    if (state == themeMode) return;
    state = themeMode;
    SharedPref.setData(key: SharedPrefKeys.theme, value: state.toString());
  }

  ThemeMode checkTheme() {
    final sharedTheme =
        SharedPref.getData(SharedPrefKeys.theme) ?? 'ThemeMode.light';
    final theme =
        sharedTheme == 'ThemeMode.light' ? ThemeMode.light : ThemeMode.dark;
    return theme;
  }
}
