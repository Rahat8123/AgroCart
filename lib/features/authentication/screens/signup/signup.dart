import 'package:agrocart/common/styles/spacing_styles.dart';
import 'package:agrocart/features/authentication/screens/signup/verify_email.dart';
import 'package:agrocart/utils/constants/colors.dart';
import 'package:agrocart/utils/constants/image_strings.dart';
import 'package:agrocart/utils/constants/sizes.dart';
import 'package:agrocart/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.black : const Color(0xFF0A74DA);
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final borderColor = isDarkMode ? Colors.grey : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor, // Dynamic background color
      body: SingleChildScrollView(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Button
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Iconsax.arrow_left, color: textColor, size: 24),
            ),

            // Title
            Center(
              child: Column(
                children: [
                  Text(
                    "Let’s create your account",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: textColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            // First Name & Last Name Row
            Row(
              children: [
                Expanded(child: _buildTextField("First Name", Iconsax.user, borderColor, textColor)),
                const SizedBox(width: TSizes.spaceBtwItems),
                Expanded(child: _buildTextField("Last Name", Iconsax.user, borderColor, textColor)),
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields),

            // Username, Email, Phone Number, Password Fields
            Column(
              children: [
                _buildTextField("Username", Iconsax.profile_circle, borderColor, textColor),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                _buildTextField("Email", Iconsax.direct_right, borderColor, textColor),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                _buildTextField("Phone Number", Iconsax.call, borderColor, textColor),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                _buildTextField("Password", Iconsax.password_check, borderColor, textColor, isPassword: true),
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            // Privacy Policy & Terms Checkbox
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                  activeColor: borderColor,
                  checkColor: backgroundColor,
                ),
                Text("I agree to the ", style: TextStyle(color: textColor)),
                TextButton(
                  onPressed: () {},
                  child: Text("Privacy Policy",
                      style: TextStyle(color: textColor, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                ),
                Text(" and ", style: TextStyle(color: textColor)),
                TextButton(
                  onPressed: () {},
                  child: Text("Terms of Use",
                      style: TextStyle(color: textColor, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                ),
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(()=>const VerifyEmail());

                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: isDarkMode ? Colors.blueGrey[900] : const Color(0xFF0A74DA),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: 5,
                ),
                child: const Text("Create Account", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            // Divider with "or Sign up With"
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Divider(color: borderColor, thickness: 0.5, indent: 60, endIndent: 5),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("or Sign up With", style: TextStyle(color: textColor)),
                ),
                Flexible(
                  child: Divider(color: borderColor, thickness: 0.5, indent: 5, endIndent: 60),
                ),
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            // Social Login Icons (Google & Facebook)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _socialButton(TImages.google, borderColor),
                const SizedBox(width: TSizes.spaceBtwItems),
                _socialButton(TImages.facebook, borderColor),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Reusable TextField Widget
  Widget _buildTextField(String label, IconData icon, Color borderColor, Color textColor, {bool isPassword = false}) {
    return TextFormField(
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: textColor),
        labelText: label,
        labelStyle: TextStyle(color: textColor),
        suffixIcon: isPassword ? Icon(Iconsax.eye_slash, color: textColor) : null,
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: borderColor)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: borderColor)),
      ),
      style: TextStyle(color: textColor),
    );
  }

  // Reusable Social Login Button
  Widget _socialButton(String imagePath, Color borderColor) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(100),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: IconButton(
        onPressed: () {},
        icon: Image(width: TSizes.iconMd, height: TSizes.iconMd, image: AssetImage(imagePath)),
      ),
    );
  }
}
