import 'package:agrocart/bindings/general_binding.dart';
import 'package:agrocart/utils/constants/colors.dart';
import 'package:agrocart/utils/constants/text_strings.dart';
import 'package:agrocart/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      home: const SplashHandler(),
    );
  }
}

class SplashHandler extends StatelessWidget {
  const SplashHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: TColors.primary,
      body: Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
