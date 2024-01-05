
  import 'package:flutter/material.dart';
  import '../controller/events_controller.dart';
  import 'package:test_holywings/core.dart';
  import 'package:get/get.dart';
  
  class EventsView extends StatelessWidget {
    const EventsView({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return GetBuilder<EventsController>(
        init: EventsController(),
        builder: (controller) {
          controller.view = this;
  
          return Scaffold(
            appBar: AppBar(
              title: const Text("Events"),
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
    