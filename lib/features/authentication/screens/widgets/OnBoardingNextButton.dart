import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';  // Import GetX for navigation (if you are using it)
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../login/login.dart';

class OnBoardingNextButton extends StatelessWidget {
  final PageController controller;
  final bool isLastPage;

  const OnBoardingNextButton({
    super.key,
    required this.controller,
    required this.isLastPage,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () {
          if (isLastPage) {
            // If it's the last page, navigate to the LoginScreen or home screen
            print("Navigate to home screen");
            Get.offAll(LoginScreen()); // Ensure you are using GetX for navigation
          } else {
            // Otherwise, move to the next page
            controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(16),
          backgroundColor: dark ? TColors.primary : Colors.black,
        ),
        child: Icon(
          isLastPage ? Icons.check : Iconsax.arrow_right,
          color: Colors.white, // Ensures the arrow icon is visible
          size: 24, // Slightly increase size for better visibility
        ),
      ),
    );
  }
}
