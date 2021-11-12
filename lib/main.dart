
import 'package:aoscompanion/providers/pre_game_settings.dart';
import 'package:aoscompanion/providers/score.dart';
import 'package:aoscompanion/screens/game_config_screen.dart';
import 'package:aoscompanion/screens/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PreGameSettings()),
        ChangeNotifierProvider(create: (context) => Score())
      ],
      child: MyApp(),
    ),
    //MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ]),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', '')
      ],
      home: HomeScreen(),
      routes: {
        GameConfigScreen.routeName: (ctx) => GameConfigScreen(),
        ScoreScreen.routeName: (ctx) => ScoreScreen()
      },
    );
  }
}


