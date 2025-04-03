import 'package:agrocart/features/shop/screens/cart/widget/cart_item.dart';
import 'package:agrocart/features/shop/screens/checkout/checkout.dart';
import 'package:agrocart/features/shop/screens/product_details/widgets/productprice.dart';
import 'package:flutter/material.dart';
import 'package:agrocart/utils/constants/colors.dart';
import 'package:agrocart/utils/constants/sizes.dart';
import 'package:agrocart/utils/constants/image_strings.dart';
import 'package:agrocart/utils/helpers/helper_functions.dart';
import 'package:agrocart/common/widget/Container/TRounded_Container.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:iconsax/iconsax.dart';

import '../../../../common/widget/icons/T_Circular_Icon.dart';
import '../../../../common/widget/image/Rounded_image.dart';
import '../../../../common/widget/products.cart/cartItem.dart';
import '../../../../common/widget/products.cart/products_cards/addremovebutton.dart';
import '../../../../common/widget/texts/product_title_text.dart';
import '../../../../common/widget/texts/t_brand_title_text_with_verified_icon.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        backgroundColor: Colors.blue,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: TCartItem(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(1.0),
        child: ElevatedButton(onPressed: () {Get.to(()=> const CheckoutScreen());} , child: Text('Checkout \$256 Taka')),
      ),


    );
  }
}





