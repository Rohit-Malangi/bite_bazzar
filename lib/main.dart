import 'package:bite_bazzar/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BITE_BAZZAR',
          home: HomeScreen(),
        );
      },
    );
  }
}
