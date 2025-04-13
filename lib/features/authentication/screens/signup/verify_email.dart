import 'package:agrocart/data/data.repository.authentication_repository.dart';
import 'package:agrocart/utils/constants/image_strings.dart';
import 'package:agrocart/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controller/Email/verify_email_controller.dart';
class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key, this.email});
  final String?email;
  @override
  Widget build(BuildContext context) {
final controller=Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {
            AuthenticationRepository.instance.logout();
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
            Text(email ?? '',style:Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
            const SizedBox(height:TSizes.spaceBtwItems),
            Text(TTexts.confirmEmailSubTitle,style:Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
            const SizedBox(height:TSizes.spaceBtwSections),
            SizedBox(width:double.infinity,child:ElevatedButton(onPressed:() {
              controller.checkEmailVerificationStatus();

            }, child:const Text(TTexts.tContinue))),
            const SizedBox(height:TSizes.spaceBtwItems),
            SizedBox(width:double.infinity,child:ElevatedButton(onPressed:() {
              controller.sendEmailVerification();
            }, child:const Text(TTexts.resendEmail))),
          ],
        ),),
      )
    );
  }
}
