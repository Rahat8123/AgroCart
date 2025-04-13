import 'package:agrocart/features/personalization/controllers/user_ccontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../data/data.repository.authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
class LoginController extends GetxController {
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final userController = Get.put(UserController());
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  @override
  void onInit(){
    super.onInit();
    email.text=localStorage.read('REMEMBER_ME_EMAIL')?? '';
    password.text=localStorage.read('REMEMBER_ME_PASSWORD')?? '';
  }
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        TImages.dockerAnimation,
      );
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        Get.snackbar("No Internet", "Please check your connection.");
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email & Password
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Stop Loader
      TFullScreenLoader.stopLoading();

      // Redirect to appropriate screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Stop Loader and show error
      TFullScreenLoader.stopLoading();
      Get.snackbar("Login Failed", e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.dockerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'No Internet', message: 'Please check your internet connection.');
        return;
      }

      // Google Authentication
      final GoogleSignIn googleSignIn = GoogleSignIn();

      // Sign out any existing session to ensure a fresh sign-in and prompt account selection
      await googleSignIn.signOut();

      // Prompt user to select an account
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        // The user cancelled the sign-in
        TFullScreenLoader.stopLoading();
        return;
      }

      // Get authentication details
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create credentials for Firebase
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Firebase
      final UserCredential userCredentials = await FirebaseAuth.instance.signInWithCredential(credential);

      // Save user record after successful sign-in
      await userController.saveUserRecord(userCredentials);

      // Stop loading and navigate to the appropriate screen
      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Handle error
      TFullScreenLoader.stopLoading(); // Stop loading in case of error
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      if (kDebugMode) {
        print('Error during Google sign-in: $e');
      }
    }
  }



}
