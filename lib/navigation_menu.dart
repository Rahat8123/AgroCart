import 'package:agrocart/utils/constants/colors.dart';
import 'package:agrocart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/shop/screens/home/home.dart';
import 'features/shop/screens/store/store.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.put(NavigationController());
    final darkmode=THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,

          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkmode?TColors.black:Colors.white,
          indicatorColor: darkmode?TColors.white.withOpacity(0.1):TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.shop_add), label: 'Marketplace'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => Expanded(child: controller.screens[controller.selectedIndex.value])),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final List<Widget> screens = [
    HomeScreen(),
    StoreScreen(),
    Container(color: Colors.green), // Marketplace (Middle)
    Container(color: Colors.orange),
    Container(color: Colors.blue),
  ];
}