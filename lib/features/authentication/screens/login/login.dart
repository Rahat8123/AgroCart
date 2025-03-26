import 'package:agrocart/common/styles/spacing_styles.dart';
import 'package:agrocart/features/authentication/screens/login/widgets/loginform.dart';
import 'package:agrocart/features/authentication/screens/login/widgets/loginheader.dart';
import 'package:agrocart/utils/constants/colors.dart';
import 'package:agrocart/utils/constants/image_strings.dart';
import 'package:agrocart/utils/constants/sizes.dart';
import 'package:agrocart/utils/constants/text_strings.dart';
import 'package:agrocart/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widget_login_signup/formdivider.dart';
import '../../../../common/widget_login_signup/socialbutton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: Color(0xFF0A74DA), // Set the full screen background to blue
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              loginheader(dark: dark),
              loginform(),
              // Divider Section
              formdivider(dark: dark,dividerText:TTexts.orSignInWith.capitalize!),

               const SizedBox(height: TSizes.spaceBtwSections/3),

              // Footer Section with Social Media Icons
              socialmidia(),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}



