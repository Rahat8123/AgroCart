import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:agrocart/common/styles/spacing_styles.dart';
import 'package:agrocart/features/authentication/screens/signup/verify_email.dart';
import 'package:agrocart/utils/constants/image_strings.dart';
import 'package:agrocart/utils/constants/sizes.dart';
import 'package:agrocart/utils/constants/text_strings.dart';
import 'package:agrocart/utils/validators/validation.dart';
import '../../controller/signup/signup_controller.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.black : const Color(0xFF0A74DA);
    final textColor = Colors.white;
    final borderColor = Colors.white;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Form(
          key: controller.signupFormKey,
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
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: textColor),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],
                ),
              ),

              // First & Last Name Fields
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      label: TTexts.firstName,
                      icon: Iconsax.user,
                      borderColor: borderColor,
                      textColor: textColor,
                      controller: controller.firstName,
                      validator: (value) => TValidator.validateEmptyText('First Name', value),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                    child: _buildTextField(
                      label: TTexts.lastName,
                      icon: Iconsax.user,
                      borderColor: borderColor,
                      textColor: textColor,
                      controller: controller.lastName,
                      validator: (value) => TValidator.validateEmptyText('Last Name', value),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: TSizes.spaceBtwInputFields),

              // Username
              _buildTextField(
                label: "Username",
                icon: Iconsax.profile_circle,
                borderColor: borderColor,
                textColor: textColor,
                controller: controller.username,
                validator: (value) => TValidator.validateEmptyText('Username', value),
              ),

              const SizedBox(height: TSizes.spaceBtwInputFields),

              // Email
              _buildTextField(
                label: "Email",
                icon: Iconsax.direct_right,
                borderColor: borderColor,
                textColor: textColor,
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
              ),

              const SizedBox(height: TSizes.spaceBtwInputFields),

              // Phone Number
              _buildTextField(
                label: "Phone Number",
                icon: Iconsax.call,
                borderColor: borderColor,
                textColor: textColor,
                controller: controller.phoneNumber,
                validator: (value) => TValidator.validatePhoneNumber(value),
              ),

              const SizedBox(height: TSizes.spaceBtwInputFields),

              // Password Field
              Obx(
                    () => TextFormField(
                  controller: controller.password,
                  obscureText: controller.hidePassword.value,
                  validator: (value) => TValidator.validatePassword(value),
                  style: TextStyle(color: textColor),
                  decoration: InputDecoration(
                    labelText: TTexts.password,
                    labelStyle: TextStyle(color: textColor),
                    prefixIcon: Icon(Iconsax.password_check, color: textColor),
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.hidePassword.value = !controller.hidePassword.value;
                      },
                      icon: Icon(
                        controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye,
                        color: textColor,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              // Terms & Conditions
              Obx(
                    () => Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Checkbox(
                      value: controller.privacyPolicy.value,
                      onChanged: (value) =>
                      controller.privacyPolicy.value = value ?? false,
                      activeColor: borderColor,
                      checkColor: backgroundColor,
                    ),
                    Text("I agree to the ", style: TextStyle(color: textColor)),
                    TextButton(
                      onPressed: () {},
                      child: Text("Privacy Policy",
                          style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                    ),
                    Text(" and ", style: TextStyle(color: textColor)),
                    TextButton(
                      onPressed: () {},
                      child: Text("Terms of Use",
                          style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              // Create Account Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.signupFormKey.currentState!.validate()) {
                      controller.signup();
                      Get.to(() => const VerifyEmail());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: isDarkMode
                        ? Colors.blueGrey[900]
                        : const Color(0xFF0A74DA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    elevation: 5,
                  ),
                  child: const Text(
                    "Create Account",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              // Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Divider(
                      color: borderColor,
                      thickness: 0.5,
                      indent: 60,
                      endIndent: 5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("or Sign up With",
                        style: TextStyle(color: textColor)),
                  ),
                  Flexible(
                    child: Divider(
                      color: borderColor,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 60,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              // Social Login Buttons
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
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required Color borderColor,
    required Color textColor,
    required TextEditingController controller,
    String? Function(String?)? validator,
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: textColor),
        prefixIcon: Icon(icon, color: textColor),
        suffixIcon: isPassword
            ? Icon(Iconsax.eye_slash, color: textColor)
            : null,
        enabledBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: borderColor)),
        focusedBorder:
        UnderlineInputBorder(borderSide: BorderSide(color: borderColor)),
      ),
    );
  }

  Widget _socialButton(String imagePath, Color borderColor) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))
        ],
      ),
      child: IconButton(
        onPressed: () {},
        icon: Image.asset(
          imagePath,
          width: TSizes.iconMd,
          height: TSizes.iconMd,
        ),
      ),
    );
  }
}
