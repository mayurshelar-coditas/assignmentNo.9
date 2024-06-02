import 'package:assignment9/core/language_model/language_constants.dart';
import 'package:assignment9/core/routes/app_router.gr.dart';
import 'package:assignment9/core/theme/app_pallete.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        AuthorsRoute(),
        BooksRoute(),
        SettingsRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          backgroundColor: Colors.white,
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: AppPallete.bottomNavBarLabelColor,
            unselectedItemColor: AppPallete.bottomNavBarLabelColor,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/home_icon.svg',
                ),
                backgroundColor: Colors.black,
                label: translation(context).home,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/author_icon.svg',
                ),
                label: translation(context).authors,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/books_icon.svg',
                ),
                label: translation(context).books,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/settings_icon.svg',
                ),
                label: translation(context).settings,
              ),
            ],
          ),
        );
      },
    );
  }
}
