import 'package:agrocart/app.dart';
import 'package:agrocart/data/data.repository.authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await GetStorage.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((_) => Get.put(AuthenticationRepository()));

  runApp(const App());
}
