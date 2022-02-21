import 'package:flutter/material.dart';
import '../../controller/home_controller.dart';
import '../page/home_error.dart';
import '../page/home_loading.dart';
import '../page/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.controller}) : super(key: key);
  final IHomeController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        if (controller.isLoading) {
          return const HomeLoading();
        }
        if (controller.hasError) {
          return HomeError(
            error: controller.error,
            onRefresh: controller.fetchList,
          );
        }
        return  HomePage(
          list: controller.list,
          onRefresh: controller.fetchList,
        );
      },
    );
  }
}
