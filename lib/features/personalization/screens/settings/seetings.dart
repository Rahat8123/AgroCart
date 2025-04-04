import 'package:agrocart/features/personalization/screens/address/address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';  // Assuming you are using the Iconsax package
import '../../../../common/listile/settings_menu_tile.dart';
import '../../../../common/listile/userprofile.dart';
import '../../../../common/widget/animatedlogout.dart';
import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/custom_Shape/containers/primary_header_container.dart';

import '../../../../common/widget/section_heading/sectionheading.dart';
import '../../../../utils/constants/colors.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../shop/screens/order/order.dart';
import '../profile/profile.dart';  // Make sure to adjust paths for your project

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  TAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context).textTheme.headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),
                  /// User Profile Card
                  TUserProfileTitle(onPressed: () { Get.to(()=> const ProfileScreen()); },), // ListTile
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ), // TPrimaryHeaderContainer

            /// -- Body
            Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
            children: [
            /// Account Settings
            const TSectionHeading(
            title: 'Account Settings',
            showActionButton: false,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            TSettingsMenuTile(
            icon: Iconsax.safe_home,
            title: 'My Addresses',
            subTitle: 'Set shopping delivery address',
              onTap: ()=> Get.to(()=>UserAddresScreen()),
            ),
            const TSettingsMenuTile(
            icon: Iconsax.shopping_cart,
            title: 'My Cart',
            subTitle: 'Add, remove products and move to checkout',
            ),
            TSettingsMenuTile(
            icon: Iconsax.bag_tick,
            title: 'My Orders',
    subTitle: 'In-progress and Completed Orders',
              onTap: ()=> Get.to(()=>const OrderScreen()),
    ),
    const TSettingsMenuTile(
    icon: Iconsax.bank,
    title: 'Bank Account',
    subTitle: 'Withdraw balance to registered bank account',
    ),
    const TSettingsMenuTile(
    icon: Iconsax.discount_shape,
    title: 'My Coupons',
    subTitle: 'List of all the discounted coupons',
    ),
    const TSettingsMenuTile(
    icon: Iconsax.notification,
    title: 'Notifications',
    subTitle: 'Set any kind of notification method',
    ),
    const TSettingsMenuTile(
    icon: Iconsax.security_card,
    title: 'Account Privacy',
    subTitle: 'Manage data usage and connected apps',
    ),

    /// App Settings
    const SizedBox(height: TSizes.spaceBtwSections),
    const TSectionHeading(
    title: 'App Settings',
    showActionButton: false,
    ),
    const SizedBox(height: TSizes.spaceBtwItems),
    const TSettingsMenuTile(
    icon: Iconsax.document_upload,
    title: 'Load Data',
    subTitle: 'Upload data to your Cloud Firebase',
    ),
              TSettingsMenuTile(
                icon: Iconsax.security_user,
                title: 'Safe Mode',
                subTitle: 'Search result is safe for all ages',
                trailing: Switch(
                  value: false,
                  onChanged: (value) {},
                ),
              ), // TSettingsMenuTile

              TSettingsMenuTile(
                icon: Iconsax.image,
                title: 'HD Image Quality',
                subTitle: 'Set image quality to be seen',
                trailing: Switch(
                  value: false,
                  onChanged: (value) {},
                ),
              ), // TSettingsMenuTile

              /// Logout Button
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child:TAnimatedLogoutButton(
                  onPressed: () {
                    // Handle Logout Logic Here
                    print("User logged out");
                  },
                ),

              ), // SizedBox

              const SizedBox(
                height: TSizes.spaceBtwSections * 2.5,
              ), // SizedBox

// Column Padding

            ],
    ), // Column
    ) // Padding

    // Add more widgets here for the body if necessary
          ],
        ), // Column
      ), // SingleChildScrollView
    );
  }
}


