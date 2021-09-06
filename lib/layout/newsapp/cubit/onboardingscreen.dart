import 'package:flutter/material.dart';
import 'package:newsapp/layout/newsapp/cubit/news_layout.dart';
import 'package:newsapp/modules/onboarding/firstpageboaring.dart';
import 'package:newsapp/modules/onboarding/secondpageboarding.dart';
import 'package:newsapp/modules/shopapp/login.dart';
import 'package:page_indicator/page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  List<Widget> screens = [FirstOnBoarding(), SecondOnBoarding()];

  bool isLast = false;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageIndicatorContainer(
              indicatorColor: Colors.grey,
              indicatorSelectorColor: Colors.blueAccent,
              padding: EdgeInsets.all(8),
              shape: IndicatorShape.defaultCircle,
              child: PageView(
                controller: _pageController,
                children: screens,
                physics: BouncingScrollPhysics(),
                // reverse: true,
                onPageChanged: (index) {
                  if (index == screens.length - 1) {
                    isLast = true;
                  } else {
                    isLast = false;
                  }
                },
              ),
              length: screens.length,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isLast) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()));
          } else {
            _pageController.nextPage(
                duration: Duration(milliseconds: 800),
                curve: Curves.easeInOutExpo);
          }
        },
        child: Icon(Icons.skip_next),
      ),
    );
  }
}
