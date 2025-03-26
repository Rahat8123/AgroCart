import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class loginform extends StatelessWidget {
  const loginform({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
                labelStyle: TextStyle(color: Colors.white), // Label text color to white
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Border color to white
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Focused border color to white
                ),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
                labelStyle: TextStyle(color: Colors.white), // Label text color to white
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Border color to white
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Focused border color to white
                ),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwInputFields / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TTexts.rememberMe, style: TextStyle(color: Colors.white)), // Text color to white
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(TTexts.forgetPassword, style: TextStyle(color: Colors.white)), // Text color to white
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            // Improved Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xFF0A74DA), // Text color to white
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners for a modern look
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16), // Increased padding for better button height
                  elevation: 5, // Add elevation to make it stand out
                ),
                child: Text(
                  TTexts.signIn,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600), // Adjusted font size and weight
                ),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            // Improved Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.white, width: 2), // Border color to white with a slight thickness
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners for a modern look
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16), // Increased padding for better button height
                ),
                child: Text(
                  TTexts.createAccount,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white, // Text color to white
                  ),
                ),
              ),
            ),

            //const SizedBox(height: TSizes.spaceBtwSections/10000),
          ],
        ),
      ),
    );
  }
}