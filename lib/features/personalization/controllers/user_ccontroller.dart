import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../data/repository/user/usermodel.dart';
import '../../../data/repository/user/userrepository.dart';
import '../../../utils/popups/loaders.dart';


class UserController extends GetxController {
  static UserController get instance => Get.find();

  // Ensure the repository is correctly instantiated
  final userRepository = Get.put(UserRepository());

  /// Save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // Convert name to first and last name
        final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        // Map Data to UserModel
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          username: username,
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        // You might want to store this user record in a repository or a database
        await userRepository.saveUserRecord(user); // Example function call to save user
      } else {
        throw Exception('User credentials are null');
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: 'Failed to save user data: $e');
      if (kDebugMode) {
        print('Error during user record save: $e');
      }
    }
  }
}
