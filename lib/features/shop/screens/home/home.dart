import 'package:agrocart/common/widget/layout/grid_layout.dart';
import 'package:agrocart/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:agrocart/features/shop/screens/home/widgets/homecatagories.dart';
import 'package:agrocart/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../../common/widget/custom_Shape/containers/circular_container.dart';
import '../../../../common/widget/custom_Shape/containers/primary_header_container.dart';
import '../../../../common/widget/custom_Shape/containers/search_container.dart';
import '../../../../common/widget/image/Rounded_image.dart';
import '../../../../common/widget/products.cart/products_cards/product_card_vertical.dart';
import '../../../../common/widget/section_heading/sectionheading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../controller/home_controller.dart';
import '../All_Products/allproducts.dart';

/// **Home Controller**


/// **Home Screen**
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections/2),

                  /// Search Bar
                  const TSearchContainer(text: 'Search in Store'),
                  const SizedBox(height: TSizes.spaceBtwSections/2),

                  /// Categories Section
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// Section Heading
                        const TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems/2),

                        /// Categories List
                        const homecatagories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Banner Image
            /// promo slider
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                   TSectionHeading(title: 'Popular Product',onPressed: (){Get.to(()=> const AllProducts());}),
                  const SizedBox(height: TSizes.spaceBtwItems),


                  TGridLayout(itemCount: 4, itemBuilder: (_,index)=>const TProductCardVertical())



                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

/// **Promo Slider Widget**

