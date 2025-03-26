import 'package:flutter/material.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class OnBoardingSkip extends StatelessWidget {
  final bool isLastPage;
  final PageController pageController;

  const OnBoardingSkip({
    super.key,
    required this.isLastPage,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: isLastPage
          ? const SizedBox.shrink()
          : TextButton(
        onPressed: () {
          pageController.animateToPage(
            2,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          backgroundColor: dark ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          'Skip',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: dark ? Colors.white : Colors.black, // ✅ Fix text color for dark mode
          ),
        ),
      ),
    );
  }
}
