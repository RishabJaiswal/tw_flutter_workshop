import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:playground/src/home_screen.dart';
import 'package:playground/src/typography_page.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Providing a restorationScopeId allows the Navigator built by the
      // MaterialApp to restore the navigation stack when a user leaves and
      // returns to the app after it has been killed while running in the
      // background.
      restorationScopeId: 'app',

      // Provide the generated AppLocalizations to the MaterialApp. This
      // allows descendant Widgets to display the correct translations
      // depending on the user's locale.
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
      ],

      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,

      // Define a function to handle named routes in order to support
      // Flutter web url navigation and deep linking.
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            // Todo: DLS: Apply your theme
            return _App(
              routeSettings: routeSettings,
            );
          },
        );
      },
    );
  }
}

class _App extends StatelessWidget {
  const _App({
    Key? key,
    required this.routeSettings,
  }) : super(key: key);

  final RouteSettings routeSettings;

  @override
  Widget build(BuildContext context) {
    switch (routeSettings.name) {
      case TypographyPage.route:
        return const TypographyPage();
      default:
        return const HomeScreen();
    }
  }
}
