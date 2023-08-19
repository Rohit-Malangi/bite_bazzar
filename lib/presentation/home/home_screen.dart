import 'package:bite_bazzar/presentation/home/widgets/home_appbar.dart';
import 'package:bite_bazzar/presentation/home/widgets/home_pageview_builder.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            HomeAppBar(),
            HomeScreenPageBuilder(),
          ],
        ),
      ),
    );
  }
}