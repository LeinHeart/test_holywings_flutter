import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_holywings/global/constants/colors.dart';
import 'package:test_holywings/global/styles/text_styles.dart';
import '../../../global/widgets/loader.dart';
import '../controller/home_controller.dart';
import 'package:test_holywings/core.dart';
import 'package:get/get.dart';

import '../model/music_chart.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          body: Container(
            width: Get.width,
            height: Get.height,
            color: KColors.kColorBg,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 40,
                  bottom: 40,
                ),
                width: Get.width,
                color: KColors.kColorBg,
                child: controller.isLoading.value
                    ? const Center(
                        child: Loader(),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // -- User Info Banner
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hi, HWG People',
                                  style: KTextStyles.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Click to Login",
                                  style: KTextStyles.roboto(
                                    textColor: KColors.kColorPrimary,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),

                          // -- Slider
                          CarouselSlider(
                            items: controller.bannerList
                                .map((banner) => Container(
                                      child: Image.network(
                                        banner.imageUrl,
                                      ),
                                    ))
                                .toList(),
                            options: CarouselOptions(
                              enlargeCenterPage: true,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 500),
                              viewportFraction: 0.8,
                              onPageChanged: (index, _) =>
                                  controller.updatePageIndicator(index),
                            ),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          // -- Login
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              height: 60,
                              decoration: BoxDecoration(
                                color: KColors.kColorBgAccent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/svg/ic_user_login.svg'),
                                  const SizedBox(width: 10.0),
                                  Text(
                                    "Login to see voucher and point information",
                                    style: KTextStyles.roboto(
                                        fontSize: 14,
                                        textColor: KColors.kColorText),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // -- Grid Menu
                          Container(
                            height: Get.height * 0.3,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.menuButtonList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3),
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      SvgPicture.asset(
                                        controller.menuButtonList[index],
                                        width: 50,
                                        height: 50,
                                      ),
                                      Text(
                                        controller.menuList[index],
                                        style: KTextStyles.roboto(
                                          textColor: KColors.kColorText,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),

                          // -- Fav Outlet
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "My Favorite Outlets",
                                  style: KTextStyles.roboto(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      textColor: KColors.kColorText),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  width: Get.width,
                                  height: 70,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: KColors.kColorBgAccent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Your favorite outlets will be shown here. Add some for easier access to reservations and more.",
                                      style: KTextStyles.roboto(fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),

                          // -- Chart Music
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: KColors.kColorBgAccent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "HWGPeople Top Chart",
                                    style: KTextStyles.roboto(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: controller.chart.songs.length,
                                    itemBuilder: (context, index) {
                                      ChartSong song =
                                          controller.chart.songs[index];
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 2,
                                                child: controller
                                                    .rankText(song.position)),
                                            Expanded(
                                              flex: 2,
                                              child: Image.network(
                                                song.song.artistProfilePicture,
                                                width: 50,
                                                height: 50,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20.0,
                                            ),
                                            Expanded(
                                              flex: 8,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    song.song.title,
                                                    style: KTextStyles.roboto(
                                                        fontSize: 15),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Text(
                                                    song.song.artistName,
                                                    style: KTextStyles.roboto(
                                                        fontSize: 15),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
