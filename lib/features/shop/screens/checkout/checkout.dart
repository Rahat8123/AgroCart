import 'package:agrocart/common/widget_login_signup/srccess_screen.dart';
import 'package:agrocart/features/shop/screens/checkout/widget/billing_Address_Section.dart';
import 'package:agrocart/features/shop/screens/checkout/widget/billing_payment_section.dart';
import 'package:agrocart/features/shop/screens/checkout/widget/billingammount.dart';
import 'package:agrocart/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/widget/Container/TRounded_COntainer.dart';
import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/products.cart/cartItem.dart';
import '../../../../common/widget/products.cart/products_cards/cupon_widget.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../cart/widget/cart_item.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Items in Cart
              TCartItem(showAddRemoveButton: false ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Coupon TextField
              TCuponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    /// Pricing
                    TBillingAmmountSection(), // Fixed incorrect name
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// Divider
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// Payment Methods
                    // (Add actual payment methods implementation here)
TBillingPaymentSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    /// Address
                    TBillingAddressSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),


                    // (Add address details here if required)
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(1.0),
        child: ElevatedButton(onPressed: () {Get.to(()=>SuccessScreen(image: TImages.successfulPaymentIcon, title: 'payment Success', subTitle: 'your Item Will be shipped Soon', onPressed: () => Get.offAll(()=> const NavigationMenu()),));} , child: Text('Checkout \$256 Taka')),
      ),
    );
  }
}


