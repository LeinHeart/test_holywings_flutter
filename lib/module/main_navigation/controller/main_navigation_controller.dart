import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_holywings/core.dart';
import 'package:test_holywings/global/constants/colors.dart';
import '../view/main_navigation_view.dart';

class MainNavigationController extends GetxController {
  MainNavigationView? view;

  final List<Widget> screens = [
    const HomeView(),
    const EventsView(),
    const ProfileView(),
  ];

  final List<NavigationDestination> bottomBarItem = [
    const NavigationDestination(
        icon: Icon(
          Icons.home,
          color: KColors.kColorBgAccent2,
        ),
        selectedIcon: Icon(
          Icons.home,
          color: KColors.kColorPrimary,
        ),
        label: "Home"),
    const NavigationDestination(
        icon: Icon(
          Icons.calendar_today,
          color: KColors.kColorBgAccent2,
        ),
        label: "Events"),
    const NavigationDestination(
        icon: Icon(
          Icons.people,
          color: KColors.kColorBgAccent2,
        ),
        label: "Profile"),
  ];

  var selectedIndex = 0.obs;

  void setPageIndex(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
