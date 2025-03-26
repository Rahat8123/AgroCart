import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class loginheader extends StatelessWidget {
  const loginheader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Center the children horizontally
      children: [
        Container(
          color: dark ? Colors.transparent : Color(0xFF0A74DA), // No color in dark mode, blue in light mode
          padding: EdgeInsets.all(16), // Optional: Add padding if necessary
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Center the children horizontally
            children: [
              // Centering the image
              Center(
                child: Image(
                  height: 150,
                  image: AssetImage(dark ? TImages.lightAppLogo : TImages.darkAppLogo),
                ),
              ),
              // Adding extra space under the image
              SizedBox(height: 30), // Adjust this value to control the space below the image
              Text(
                TTexts.loginTitle,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white), // Text color to white
              ),
              const SizedBox(height: TSizes.sm),
              Text(
                TTexts.loginSubTitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white), // Text color to white
              ),
            ],
          ),
        ),
      ],
    );
  }
}