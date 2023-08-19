import 'package:bite_bazzar/presentation/common_widgets/big_text.dart';
import 'package:bite_bazzar/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../common_widgets/small_text.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.65.w, vertical: 0.53.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: 'INDIA', color: AppColors.mainColor),
              Row(
                children: [
                  const SmallText(text: 'Dehradun', color: Colors.black54),
                  GestureDetector(
                    onTap: null,
                    child: const Icon(Icons.arrow_drop_down_outlined),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 5.95.h,
          width: 11.70.w,
          margin: EdgeInsets.symmetric(horizontal: 4.65.w, vertical: 0.53.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.mainColor),
          child: const Icon(Icons.search, color: Colors.white),
        )
      ],
    );
  }
}
