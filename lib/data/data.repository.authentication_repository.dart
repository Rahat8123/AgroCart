import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';
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

  void screenRedirect() async {
    if (kDebugMode) {
      print('-----get Storage------');
      print(deviceStorage.read(isFirstTimeKey));
    }

    deviceStorage.writeIfNull(isFirstTimeKey, true);

    final isFirstTime = deviceStorage.read(isFirstTimeKey);
    if (isFirstTime != true) {
      Get.offAll(() => const LoginScreen());
    } else {
      Get.offAll(() => const OnBoardingScreen());
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
