import 'package:base_project/core/network/local/shared_pref.dart';
import 'package:base_project/core/routes/route_provider.dart';
import 'package:base_project/core/utils/app_constance.dart';
import 'package:base_project/core/utils/language_provider.dart';
import 'package:base_project/core/utils/theme/dark_theme.dart';
import 'package:base_project/core/utils/theme/light_theme.dart';
import 'package:base_project/core/utils/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final route = ref.watch(routeProvider);
    final language = ref.watch(localeProvider);
    final theme = ref.watch(themeProvider);
    return MaterialApp.router(
      title: AppConstance.appName,
      theme: LightTheme.init(context),
      darkTheme: DarkTheme.init(context),
      debugShowCheckedModeBanner: false,
      themeMode: theme,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: language,
      routerConfig: route,
    );
  }
}
