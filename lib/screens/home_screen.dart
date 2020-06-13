import 'package:cookle/widgets/app_bar.dart';
import 'package:cookle/widgets/body.dart';
import 'package:cookle/widgets/bottom_nav_bar.dart';
import 'package:cookle/widgets/provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: homeAppBar(context),
      bottomNavigationBar: BottomNavBar(),
      body: WidgetWithSharedData(
        child: Body()
      ),
    );
  }
}