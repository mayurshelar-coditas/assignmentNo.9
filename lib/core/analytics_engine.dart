import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsEngine {
  static final _instance = FirebaseAnalytics.instance;

  static void userLogsIn(String loginMethod) async {
    return await _instance.logLogin(
      loginMethod: loginMethod,
    );
  }

  static void userSignsUp(String signupMethod) async {
    return await _instance.logSignUp(
      signUpMethod: signupMethod,
    );
  }

  static void clickedTabOfBottomNavBar(String pageName) async {
    return await _instance.logEvent(
      name: "pages_tracked",
      parameters: {"pageName": pageName},
    );
  }
}
