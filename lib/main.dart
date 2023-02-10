import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/internationalization.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'app_state.dart';
import 'router/back_dispatcher.dart';
import 'router/router_delegate.dart';
import 'router/kl_parser.dart';
import 'router/ui_pages.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterFlowTheme.initialize();
  setUrlStrategy(PathUrlStrategy());

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  final appState = AppState();
  late KLRouterDelegate delegate;
  final parser = KLParser();
  late KLBackButtonDispatcher backButtonDispatcher;

  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  _MyAppState() {
    delegate = KLRouterDelegate(appState);
    backButtonDispatcher = KLBackButtonDispatcher(delegate);
    delegate.setNewRoutePath(DonationPageConfig);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setLocale(Locale value) => setState(() => _locale = value);

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (_) => appState,
      child: MaterialApp.router(
        title: 'KaiserLions Online-Spende',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          FFLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: _locale,
        supportedLocales: const [Locale('en', '')],
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(brightness: Brightness.dark),
        themeMode: _themeMode,
        backButtonDispatcher: backButtonDispatcher,
        routerDelegate: delegate,
        routeInformationParser: parser,
      ),
    );
  }
}
