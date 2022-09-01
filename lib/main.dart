import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zemoga_app/routes/router.dart';
import 'package:zemoga_app/services/services.dart';
import 'package:zemoga_app/utils/colors.dart';

part './config/app_config.dart';

Future<void> main() async {
  await initConfig();
  runApp(const ProviderScope(child: ZemogaApp()));
}

class ZemogaApp extends StatelessWidget {
  const ZemogaApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Zemoga App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      localizationsDelegates: const [
        AppLocalizationService.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
      localeResolutionCallback: _localeCallback,
      routeInformationProvider: RouterConfig.router.routeInformationProvider,
      routeInformationParser: RouterConfig.router.routeInformationParser,
      routerDelegate: RouterConfig.router.routerDelegate,
      scrollBehavior: _AppScrollBehavior(),
    );
  }
}
