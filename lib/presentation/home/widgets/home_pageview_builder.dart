import 'package:bite_bazzar/presentation/common_widgets/big_text.dart';
import 'package:bite_bazzar/presentation/common_widgets/icon_with_text.dart';
import 'package:bite_bazzar/presentation/common_widgets/small_text.dart';
import 'package:bite_bazzar/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:sizer/sizer.dart';

class HomeScreenPageBuilder extends StatefulWidget {
  const HomeScreenPageBuilder({super.key});

  @override
  State<HomeScreenPageBuilder> createState() => _HomeScreenPageBuilderState();
}

class _HomeScreenPageBuilderState extends State<HomeScreenPageBuilder> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  var _pageValue = 0.0;
  final _scaleFactor = 0.8;
  final _height = 23.60.h;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        _pageValue = _pageController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  double getCurrTrans(double currScale) {
    return _height * (1 - currScale) / 2;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 32.18.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 5,
            itemBuilder: (context, index) => _buildPageBody(index),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: PageViewDotIndicator(
            currentItem: _pageValue.floor(),
            count: 5,
            unselectedColor: Colors.black26,
            selectedColor: AppColors.mainColor,
            boxShape: BoxShape.circle,
          ),
        ),
      ],
    );
  }

  Widget _buildPageBody(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _pageValue.floor()) {
      var currScale = 1 - (_pageValue - index) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, getCurrTrans(currScale), 0);
    } else if (index == _pageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_pageValue - index + 1) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, getCurrTrans(currScale), 0);
    } else if (index == _pageValue.floor() - 1) {
      var currScale = 1 - (_pageValue - index) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, getCurrTrans(currScale), 0);
    } else {
      var currScale = _scaleFactor;
      matrix = Matrix4.diagonal3Values(1, _scaleFactor, 1)
        ..setTranslationRaw(0, getCurrTrans(currScale), 0);
    }
    print({100.h});
    print('${100.w} + ${MediaQuery.of(context).size}');
    return Transform(
      transform: matrix,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(
              height: _height,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/image/food0.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(45),
                color: index.isEven ? Colors.orange : Colors.deepPurple,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 12.87.h,
                width: 65.11.w,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFe8e8e8),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BigText(text: 'Chainese Side'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: AppColors.mainColor,
                                size: 20,
                              ),
                            ),
                          ),
                          const SmallText(text: '4.5'),
                          const SmallText(text: '1287  comments'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconWithText(
                            icon: Icons.circle_sharp,
                            text: 'Normal',
                            iconColor: AppColors.iconColor1,
                          ),
                          IconWithText(
                            icon: Icons.location_on,
                            text: '1.7km',
                            iconColor: AppColors.mainColor,
                          ),
                          IconWithText(
                            icon: Icons.access_time_rounded,
                            text: '32min',
                            iconColor: AppColors.iconColor2,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
