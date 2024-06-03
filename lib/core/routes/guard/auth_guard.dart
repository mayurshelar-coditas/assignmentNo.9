import 'package:assignment9/core/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final hasLoggedIn = pref.getBool('isLoggedIn') ?? false;
    final hasOnboarded = pref.getBool('onBoardedOnce') ?? false;

    if (hasLoggedIn == true) {
      resolver.next(true);
    } else if (hasOnboarded == false) {
      router.replaceAll(
        const [
          OnboardingRouteOne(),
        ],
      );
    } else {
      router.replaceAll(
        const [
          LoginRoute(),
        ],
      );
    }
  }
}
