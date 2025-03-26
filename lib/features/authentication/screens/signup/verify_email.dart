import 'package:agrocart/common/widget_login_signup/srccess_screen.dart';
import 'package:agrocart/features/authentication/screens/login/login.dart';
import 'package:agrocart/utils/constants/image_strings.dart';
import 'package:agrocart/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {
            Get.offAll(()=>LoginScreen());
          }, icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child:Padding(
            padding:EdgeInsets.all(TSizes.defaultSpace) ,
        child: Column(
          children: [
            // image
Image(image:AssetImage(TImages.deliveredEmailIllustration),width: THelperFunctions.screenWidth()*0.6,),
            const SizedBox(height:TSizes.spaceBtwSections),
            // Title and Sub Title.new
Text(TTexts.confirmEmail,style:Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
            const SizedBox(height:TSizes.spaceBtwItems),
            Text('rayhanulrahat8123@gmail.com',style:Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
            const SizedBox(height:TSizes.spaceBtwItems),
            Text(TTexts.confirmEmailSubTitle,style:Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
            const SizedBox(height:TSizes.spaceBtwSections),
            // Buttons
            SizedBox(width:double.infinity,child:ElevatedButton(onPressed:() {
Get.to(()=>SuccessScreen(
  image:TImages.staticSuccessIllustration,
title: TTexts.yourAccountCreatedTitle,
subTitle: TTexts.yourAccountCreatedSubTitle,
  onPressed: ()=>Get.to(()=>const LoginScreen()),
));
            }, child:const Text(TTexts.tContinue))),
            const SizedBox(height:TSizes.spaceBtwItems),
            SizedBox(width:double.infinity,child:ElevatedButton(onPressed:() {

            }, child:const Text(TTexts.resendEmail))),
          ],
        ),),
      )
    );
  }
}
