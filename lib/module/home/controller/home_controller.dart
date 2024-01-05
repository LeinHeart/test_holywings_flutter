import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_holywings/global/constants/colors.dart';
import 'package:test_holywings/global/constants/constant.dart';
import 'package:test_holywings/global/styles/text_styles.dart';
import 'package:test_holywings/module/home/model/music_chart.dart';
import '../model/banner_model.dart';
import '../view/home_view.dart';

import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  HomeView? view;
  var isLoading = true.obs;

  List<BannerModel> bannerList = [];
  var bannerSliderCurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    bannerSliderCurrentIndex.value = index;
    update();
  }

  getBannerData() async {
    var url = Uri.parse('$API_URL/whats-on/banner');
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final output = jsonDecode(response.body);
        for (var banner in output['data']) {
          BannerModel convertedBanner = BannerModel.fromJson(banner);
          bannerList.add(convertedBanner);
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  List<String> menuButtonList = [
    'assets/svg/ic_atlas_logo.svg',
    'assets/svg/ic_home_reservation.svg',
    'assets/svg/ic_home_outlets.svg',
    'assets/svg/ic_bottles.svg',
    'assets/svg/ic_whatson.svg',
    'assets/svg/ic_event.svg',
  ];

  List<String> menuList = [
    "Atlas",
    "Reservation",
    "Outlet",
    "My Bottles",
    "What's On",
    "Events",
  ];

  late ChartData chart;

  Text rankText(int rank) {
    Color textColor = (rank == 1 || rank == 2 || rank == 3)
        ? KColors.kColorPrimary
        : KColors.kColorText;

    return Text(
      checkRank(rank),
      style: KTextStyles.roboto(
        textColor: textColor,
        fontWeight: rank == 1 ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  String checkRank(int rank) {
    String rankingText = "";

    if (rank == 1) {
      rankingText = "${rank}st";
    } else if (rank == 2) {
      rankingText = "${rank}nd";
    } else if (rank == 3) {
      rankingText = "${rank}rd";
    } else {
      rankingText = "${rank}th";
    }

    return rankingText;
  }

  getChartData() async {
    var url = Uri.parse('$API_URL/songs/charts/latest');
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final output = jsonDecode(response.body);
        chart = ChartData.fromJson(output['data']);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  initialization() async {
    await getBannerData();
    await getChartData();
    isLoading.value = false;
    update();
  }

  @override
  void onInit() {
    initialization();
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
