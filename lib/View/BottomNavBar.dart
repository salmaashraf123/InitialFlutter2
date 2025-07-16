import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:projects/View/Cart.dart';
import 'package:projects/View/Favorite.dart';
import 'package:projects/View/Profile.dart';
import 'package:projects/View/Shop.dart';

import 'HomePage.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
   final navController =  PersistentTabController();
   List<Widget> _buildScreens() {
     return [
        HomePage(),
        ShopPage(),
        CartPage(),
        FavPage(),
        ProfilePage(),
     ];
   }
   List<PersistentBottomNavBarItem> _navBarsItems() {
     return [
       PersistentBottomNavBarItem(
         icon: Icon(CupertinoIcons.home),
         title: ("Home"),
         activeColorPrimary: CupertinoColors.activeGreen,
         inactiveColorPrimary: CupertinoColors.systemGrey,
         routeAndNavigatorSettings: RouteAndNavigatorSettings(
           initialRoute: "/",
         ),
       ),
       PersistentBottomNavBarItem(
         icon: Icon(CupertinoIcons.bag),
         title: ("Shop"),
         activeColorPrimary: CupertinoColors.activeGreen,
         inactiveColorPrimary: CupertinoColors.systemGrey,
         routeAndNavigatorSettings: RouteAndNavigatorSettings(
           initialRoute: "/",
         ),
       ),
       PersistentBottomNavBarItem(
         icon: Icon(CupertinoIcons.shopping_cart),
         title: ("Cart"),
         activeColorPrimary: CupertinoColors.activeGreen,
         inactiveColorPrimary: CupertinoColors.systemGrey,
         routeAndNavigatorSettings: RouteAndNavigatorSettings(
           initialRoute: "/",
         ),
       ),
       PersistentBottomNavBarItem(
         icon: Icon(Icons.favorite_border_rounded),
         title: ("Favorites"),
         activeColorPrimary: CupertinoColors.activeGreen,
         inactiveColorPrimary: CupertinoColors.systemGrey,
         routeAndNavigatorSettings: RouteAndNavigatorSettings(
           initialRoute: "/",
         ),
       ),
       PersistentBottomNavBarItem(
         icon: Icon(CupertinoIcons.profile_circled),
         title: ("Profile"),
         activeColorPrimary: CupertinoColors.activeGreen,
         inactiveColorPrimary: CupertinoColors.systemGrey,
         routeAndNavigatorSettings: RouteAndNavigatorSettings(
           initialRoute: "/",
         ),
       ),
     ];
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PersistentTabView(
          context,
          controller: navController,
          screens: _buildScreens(),
          items: _navBarsItems(),
          handleAndroidBackButtonPress: true,
          // Default is true.
          resizeToAvoidBottomInset: true,
          // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
          stateManagement: true,
          // Default is true.
          hideNavigationBarWhenKeyboardAppears: true,
          padding: const EdgeInsets.only(top: 8),
          backgroundColor: Colors.white,
          isVisible: true,
          animationSettings: const NavBarAnimationSettings(
            navBarItemAnimation: ItemAnimationSettings( // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 400),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimationSettings( // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              duration: Duration(milliseconds: 200),
              screenTransitionAnimationType: ScreenTransitionAnimationType
                  .fadeIn,
            ),
          ),
          confineToSafeArea: true,
          navBarHeight: kBottomNavigationBarHeight,
          navBarStyle: NavBarStyle.style3,
        )
    );
  }
}
