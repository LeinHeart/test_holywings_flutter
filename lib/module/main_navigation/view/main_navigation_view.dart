import 'package:flutter/material.dart';
import 'package:test_holywings/global/constants/colors.dart';
import '../controller/main_navigation_controller.dart';
import 'package:test_holywings/core.dart';
import 'package:get/get.dart';

class MainNavigationView extends StatelessWidget {
  const MainNavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavigationController>(
      init: MainNavigationController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          body: Obx(() => controller.screens[controller.selectedIndex.value]),
          bottomNavigationBar: Obx(
            () => NavigationBar(
              backgroundColor: KColors.kColorBgAccent,
              height: 60,
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: controller.setPageIndex,
              destinations: controller.bottomBarItem,
            ),
          ),
        );
      },
    );
  }
}
