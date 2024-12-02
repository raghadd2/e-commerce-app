import 'package:base_project/core/network/local/shared_pref.dart';
import 'package:base_project/core/network/local/shared_pref_key.dart';
import 'package:base_project/core/utils/app_constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final langProvider =
    NotifierProvider<LanguageProvider, String>(() => LanguageProvider());

final localeProvider = Provider<Locale>((ref) {
  final language = ref.watch(langProvider);
  return Locale(language);
});

class LanguageProvider extends Notifier<String> {
  @override
  String build() {
    return SharedPref.getData(SharedPrefKeys.language) ?? AppConstance.arLang;
  }

  void changeLanguage(String language) {
    if (state == language) return;
    state = language;
    SharedPref.setData(key: SharedPrefKeys.language, value: state);
  }
}
