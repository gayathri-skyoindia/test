import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mahabharat_museum/pages/widgets/my_drawer.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../controller/dashboard_controller.dart';
import '../utilities/my_consts.dart';
import 'home_page.dart';

class HomeTabPage extends GetView {
  HomeTabPage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final DashBoardController homeController = Get.find();

  PersistentTabController tabController =
      PersistentTabController(initialIndex: 0);

  List<Widget> buildScreens() {
    return [HomePage(), HomePage(), HomePage(), HomePage(), HomePage()];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_filled),
        title: ("Home"),
        activeColorPrimary: MyConsts.secondaryColor,
        inactiveColorPrimary: MyConsts.homeIconColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.location_solid),
        title: ("Near By"),
        activeColorPrimary: MyConsts.secondaryColor,
        inactiveColorPrimary: MyConsts.homeIconColor,
      ),
      PersistentBottomNavBarItem(
        iconSize: 30,
        icon: Icon(
          CupertinoIcons.qrcode_viewfinder,
          color: Get.theme.primaryColor,
        ),
        title: ("Qr Scan"),
        activeColorPrimary: Get.theme.colorScheme.primary, // Active dot color
        inactiveColorPrimary: MyConsts.homeIconColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.ticket),
        title: ("Bookings"),
        activeColorPrimary: MyConsts.secondaryColor,
        inactiveColorPrimary: MyConsts.homeIconColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.image_outlined),
        title: ("Gallery"),
        activeColorPrimary: MyConsts.secondaryColor,
        inactiveColorPrimary: MyConsts.homeIconColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey, // Make sure you assign the key here
        appBar: AppBar(
          toolbarHeight: 57,
          leading: Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 0, 5),
              child: Image.asset(
                "assets/images/app_logo.png",
                fit: BoxFit.contain,
                height: Get.height * 0.05,
              )),
          centerTitle: false,
          leadingWidth: Get.width * 0.3,
          actions: [
            GestureDetector(
              onTap: () {
                // _scaffoldKey.currentState?.openDrawer();
              },
              child: Container(
                height: 57,
                width: 57,
                padding: const EdgeInsets.fromLTRB(12, 4, 12, 0),
                child: const Icon(CupertinoIcons.bell),
              ),
            ),
            GestureDetector(
              onTap: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              child: Container(
                height: 57,
                width: 57,
                margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: SvgPicture.asset(
                  'assets/images/svg/burger_icon.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
        drawer: const MyDrawer(),
        body: PersistentTabView(
          context,
          controller: tabController,
          screens: buildScreens(),
          items: navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.black, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(20.0),
            colorBehindNavBar: Colors.black,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle
              .style15, // Choose the nav bar style with this property.
        ));
  }
}
