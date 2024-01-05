
  import 'package:flutter/material.dart';
  import '../controller/chart_controller.dart';
  import 'package:test_holywings/core.dart';
  import 'package:get/get.dart';
  
  class ChartView extends StatelessWidget {
    const ChartView({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return GetBuilder<ChartController>(
        init: ChartController(),
        builder: (controller) {
          controller.view = this;
  
          return Scaffold(
            appBar: AppBar(
              title: const Text("Chart"),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: const [],
                ),
              ),
            ),
          );
        },
      );
    }
  }
    