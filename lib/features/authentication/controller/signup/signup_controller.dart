import 'package:agrocart/data/data.repository.authentication_repository.dart';
import 'package:agrocart/data/repository/user/userrepository.dart';
import 'package:agrocart/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/repository/user/usermodel.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../screens/signup/verify_email.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;

  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        TImages.dockerAnimation,
      );

      // 1. Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoaders.warningSnackBar(
          title: 'No Internet',
          message: 'Please check your connection and try again.',
        );
        return;
      }

      // 2. Validate Form
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();

        return;
      }

      // 3. Check Privacy Policy
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'To create an account, you must accept the Privacy Policy & Terms.',
        );
        return;
      }

      // 4. Register with Firebase Auth
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // 5. Save user profile data
      final newUser=UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
final userRepository =Get.put(UserRepository());
await userRepository.saveUserRecord(newUser);
      // Success

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: "Success", message: "Account created successfully.");
      Get.to(()=>const VerifyEmail());

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Signup Failed', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
