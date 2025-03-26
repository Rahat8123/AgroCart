import 'package:flutter/material.dart';
import 'package:agrocart/utils/constants/image_strings.dart';
import 'package:agrocart/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../widgets/OnBoardingNextButton.dart';

import '../widgets/OnBoarding_skip.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/onboardingnavigation.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController, // ✅ Assign PageController
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          OnBoardingSkip(
              isLastPage: _currentPage == 2, pageController: _pageController),
          OnBoardingDotNavigation(pageController: _pageController), // ✅ Fixed
          OnBoardingNextButton(
              controller: _pageController, isLastPage: _currentPage == 2),
        ],
      ),
    );
  }
}
