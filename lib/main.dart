import 'package:assignment9/core/language_model/language_constants.dart';
import 'package:assignment9/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MainState? state = context.findAncestorStateOfType<_MainState>();
    state?.setLocale(newLocale);
  }
}

class _MainState extends State<Main> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    getLocale().then((locale) => {setLocale(locale)});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter().config(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
    );
  }
}
