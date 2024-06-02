// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:assignment9/features/authentication/presentation/pages/login_page.dart'
    as _i8;
import 'package:assignment9/features/authentication/presentation/pages/signup_page.dart'
    as _i16;
import 'package:assignment9/features/author/presentation/pages/author_page_navigation.dart'
    as _i1;
import 'package:assignment9/features/author/presentation/pages/authors_page.dart'
    as _i2;
import 'package:assignment9/features/books/presentation/pages/books_page.dart'
    as _i3;
import 'package:assignment9/features/books/presentation/pages/books_page_navigation.dart'
    as _i4;
import 'package:assignment9/features/home/presentation/pages/home_page.dart'
    as _i5;
import 'package:assignment9/features/home/presentation/pages/home_page_navigation.dart'
    as _i6;
import 'package:assignment9/features/home/presentation/pages/item_details.dart'
    as _i7;
import 'package:assignment9/features/main_screen/presentation/pages/main_screen.dart'
    as _i9;
import 'package:assignment9/features/onboarding/presentation/pages/onboarding_navigation.dart'
    as _i10;
import 'package:assignment9/features/onboarding/presentation/pages/onboarding_page_one.dart'
    as _i11;
import 'package:assignment9/features/onboarding/presentation/pages/onboarding_page_three.dart'
    as _i12;
import 'package:assignment9/features/onboarding/presentation/pages/onboarding_page_two.dart'
    as _i13;
import 'package:assignment9/features/settings/presentation/pages/settings_navigation_page.dart'
    as _i14;
import 'package:assignment9/features/settings/presentation/pages/settings_page.dart'
    as _i15;
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;

abstract class $AppRouter extends _i17.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    AuthorRouteNavigation.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthorPageNavigation(),
      );
    },
    AuthorsRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthorsPage(),
      );
    },
    BooksRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.BooksPage(),
      );
    },
    BooksRouteNavigation.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.BooksPageNavigation(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomePage(),
      );
    },
    HomeRouteNavigation.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomePageNavigation(),
      );
    },
    ItemDetails.name: (routeData) {
      final args = routeData.argsAs<ItemDetailsArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.ItemDetails(
          key: args.key,
          itemIndex: args.itemIndex,
          itemName: args.itemName,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.LoginPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.MainScreen(),
      );
    },
    OnboardingNavigation.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.OnboardingNavigation(),
      );
    },
    OnboardingRouteOne.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.OnboardingPageOne(),
      );
    },
    OnboardingRouteThree.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.OnboardingPageThree(),
      );
    },
    OnboardingRouteTwo.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.OnboardingPageTwo(),
      );
    },
    SettingsNavigationRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SettingsNavigationPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.SettingsPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.SignUpPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthorPageNavigation]
class AuthorRouteNavigation extends _i17.PageRouteInfo<void> {
  const AuthorRouteNavigation({List<_i17.PageRouteInfo>? children})
      : super(
          AuthorRouteNavigation.name,
          initialChildren: children,
        );

  static const String name = 'AuthorRouteNavigation';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AuthorsPage]
class AuthorsRoute extends _i17.PageRouteInfo<void> {
  const AuthorsRoute({List<_i17.PageRouteInfo>? children})
      : super(
          AuthorsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthorsRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i3.BooksPage]
class BooksRoute extends _i17.PageRouteInfo<void> {
  const BooksRoute({List<_i17.PageRouteInfo>? children})
      : super(
          BooksRoute.name,
          initialChildren: children,
        );

  static const String name = 'BooksRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i4.BooksPageNavigation]
class BooksRouteNavigation extends _i17.PageRouteInfo<void> {
  const BooksRouteNavigation({List<_i17.PageRouteInfo>? children})
      : super(
          BooksRouteNavigation.name,
          initialChildren: children,
        );

  static const String name = 'BooksRouteNavigation';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i17.PageRouteInfo<void> {
  const HomeRoute({List<_i17.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomePageNavigation]
class HomeRouteNavigation extends _i17.PageRouteInfo<void> {
  const HomeRouteNavigation({List<_i17.PageRouteInfo>? children})
      : super(
          HomeRouteNavigation.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouteNavigation';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ItemDetails]
class ItemDetails extends _i17.PageRouteInfo<ItemDetailsArgs> {
  ItemDetails({
    _i18.Key? key,
    required int itemIndex,
    required String itemName,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          ItemDetails.name,
          args: ItemDetailsArgs(
            key: key,
            itemIndex: itemIndex,
            itemName: itemName,
          ),
          initialChildren: children,
        );

  static const String name = 'ItemDetails';

  static const _i17.PageInfo<ItemDetailsArgs> page =
      _i17.PageInfo<ItemDetailsArgs>(name);
}

class ItemDetailsArgs {
  const ItemDetailsArgs({
    this.key,
    required this.itemIndex,
    required this.itemName,
  });

  final _i18.Key? key;

  final int itemIndex;

  final String itemName;

  @override
  String toString() {
    return 'ItemDetailsArgs{key: $key, itemIndex: $itemIndex, itemName: $itemName}';
  }
}

/// generated route for
/// [_i8.LoginPage]
class LoginRoute extends _i17.PageRouteInfo<void> {
  const LoginRoute({List<_i17.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i9.MainScreen]
class MainRoute extends _i17.PageRouteInfo<void> {
  const MainRoute({List<_i17.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i10.OnboardingNavigation]
class OnboardingNavigation extends _i17.PageRouteInfo<void> {
  const OnboardingNavigation({List<_i17.PageRouteInfo>? children})
      : super(
          OnboardingNavigation.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingNavigation';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i11.OnboardingPageOne]
class OnboardingRouteOne extends _i17.PageRouteInfo<void> {
  const OnboardingRouteOne({List<_i17.PageRouteInfo>? children})
      : super(
          OnboardingRouteOne.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRouteOne';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i12.OnboardingPageThree]
class OnboardingRouteThree extends _i17.PageRouteInfo<void> {
  const OnboardingRouteThree({List<_i17.PageRouteInfo>? children})
      : super(
          OnboardingRouteThree.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRouteThree';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i13.OnboardingPageTwo]
class OnboardingRouteTwo extends _i17.PageRouteInfo<void> {
  const OnboardingRouteTwo({List<_i17.PageRouteInfo>? children})
      : super(
          OnboardingRouteTwo.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRouteTwo';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SettingsNavigationPage]
class SettingsNavigationRoute extends _i17.PageRouteInfo<void> {
  const SettingsNavigationRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SettingsNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsNavigationRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i15.SettingsPage]
class SettingsRoute extends _i17.PageRouteInfo<void> {
  const SettingsRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i16.SignUpPage]
class SignUpRoute extends _i17.PageRouteInfo<void> {
  const SignUpRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}
