import 'package:assignment9/core/dependency_injection/di_container.dart';
import 'package:assignment9/core/language_model/language_constants.dart';
import 'package:assignment9/core/routes/app_router.dart';
import 'package:assignment9/core/services/notification_services.dart';
import 'package:assignment9/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  setup();
  runApp(const Main());
}

//Method for background notifications 
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
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

  final NotificationServices notificationServices = NotificationServices();

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    getLocale().then((locale) => {setLocale(locale)});
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit(context);
    notificationServices
        .getDeviceToken()
        .then((value) => print('Token $value'));

    // notificationServices.isTokenRefresh(); //To check if token has expired
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
