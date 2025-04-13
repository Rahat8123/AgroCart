import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/signup/verify_email.dart';
import '../navigation_menu.dart';
import '../utils/exceptions/firebase_auth_exceptions.dart';
import '../utils/exceptions/firebase_exceptions.dart';
import '../utils/exceptions/format_exceptions.dart';
import '../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();


  final deviceStorage = GetStorage();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  static const String isFirstTimeKey = 'isFirstTime';

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  Future<void> screenRedirect() async {
    final user=_auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        // Navigate to the main app screen if email is verified
        Get.offAll(() => const NavigationMenu());
      } else {
        // Navigate to Verify Email Screen if not verified
        Get.offAll(() => VerifyEmail(email: user.email));
      }
    } else {
      // Handle first-time user logic using local storage
      await deviceStorage.writeIfNull('IsFirstTime', true);

      final isFirstTime = await deviceStorage.read('IsFirstTime') != true;

      if (isFirstTime) {
        Get.offAll(() => const OnBoardingScreen());
      } else {
        Get.offAll(() => const LoginScreen());
      }
    }
  }


  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  // ✅ Firebase Registration Method
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future <void> sendEmailVerification()async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }



  Future<UserCredential?> signInWithGoogle() async {
    try {
final GoogleSignInAccount? userAccount=await GoogleSignIn().signIn();
final GoogleSignInAuthentication ? googleAuth=await userAccount ?.authentication;
final credentials = GoogleAuthProvider.credential(accessToken:googleAuth?.accessToken,idToken: googleAuth?.idToken);
return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      // Handle FirebaseAuth specific exceptions
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      // Handle general Firebase exceptions
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      // Handle format exceptions
      throw const TFormatException();
    } on PlatformException catch (e) {
      // Handle platform-specific exceptions
      throw TPlatformException(e.code).message;
    } catch (e) {
      // Catch any other unhandled exceptions
      if (kDebugMode) {
        print('Something went wrong: $e');
      }
      // You can throw a generic exception here if needed
      return null;
    }
    return null;
  }

  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // ✅ Save additional user profile to Firestore
  Future<void> saveUserRecord({
    required String uid,
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String phone,
  }) async {
    try {
      await _db.collection("Users").doc(uid).set({
        'uid': uid,
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'email': email,
        'phone': phone,
        'createdAt': DateTime.now(),
      });
    } catch (e) {
      throw 'Failed to save user data: $e';
    }
  }
}
