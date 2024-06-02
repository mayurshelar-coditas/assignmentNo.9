import 'package:assignment9/core/routes/guard/auth_guard.dart';

import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        //Onboarding routes
        AutoRoute(
          page: OnboardingNavigation.page,
          children: [
            AutoRoute(
              page: OnboardingRouteOne.page,
            ),
            AutoRoute(page: OnboardingRouteTwo.page),
            AutoRoute(page: OnboardingRouteThree.page),
          ],
        ),

        //Authentication Routes
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(page: SignUpRoute.page),

        //MainScreen Routes
        AutoRoute(
          page: MainRoute.page,
          children: [
            //Home Page routes
            AutoRoute(
              page: HomeRouteNavigation.page,
              children: [
                AutoRoute(page: HomeRoute.page, initial: true),
                AutoRoute(page: ItemDetails.page),
              ],
              initial: true,
            ),

            //Authors Routes
            AutoRoute(
              page: AuthorRouteNavigation.page,
              children: [
                AutoRoute(
                  page: AuthorsRoute.page,
                  initial: true,
                ),
                AutoRoute(page: ItemDetails.page),
              ],
            ),

            //Books routes
            AutoRoute(
              page: BooksRouteNavigation.page,
              children: [
                AutoRoute(
                  page: BooksRoute.page,
                  initial: true,
                ),
                AutoRoute(page: ItemDetails.page),
              ],
            ),

            //Settings routes
            AutoRoute(
              page: SettingsNavigationRoute.page,
              children: [
                AutoRoute(
                  page: SettingsRoute.page,
                  initial: true,
                ),
              ],
            ),
          ],
          initial: true,
          guards: [
            AuthGuard(),
          ],
        ),
      ];
}
