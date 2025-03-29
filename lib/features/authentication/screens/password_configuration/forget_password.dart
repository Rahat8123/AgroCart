import 'package:agrocart/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:agrocart/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';

class ForgetPassword extends StatelessWidget{
  const ForgetPassword({super.key});

  Widget build (BuildContext context){
    return Scaffold(
      appBar:AppBar(),
      body: Padding(
        padding:EdgeInsets.all(TSizes.defaultSpace),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children:[

            // heading
            Text(TTexts.forgetPasswordTitle,style : Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height:TSizes.spaceBtwItems),
            Text(TTexts.forgetPasswordSubTitle,style : Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height:TSizes.spaceBtwSections*2),
            // TextField
            TextFormField(
              decoration : const InputDecoration(labelText:TTexts.email,prefixIcon: Icon(Iconsax.direct_right))
            ),
            const SizedBox(height:TSizes.spaceBtwSections),
            // SubmitButton
            SizedBox(width: double.infinity,child:ElevatedButton(onPressed: () {
              Get.off(()=>const ResetPassword());
            }, child: const Text(TTexts.submit)))





          ]
        )
      )
    );
  }
}