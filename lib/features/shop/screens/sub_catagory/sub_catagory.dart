
import 'package:agrocart/common/widget/products.cart/products_cards/product_cart_horizontal.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/image/Rounded_image.dart';
import '../../../../common/widget/section_heading/sectionheading.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Cattle'),
        showBackArrow: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const TRoundedImage(
                width: double.infinity,

                imageUrl: 'assets/image/banners/cattlebanner3.png',
                applyImageRadius: true,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Sub-Categories
              Column(
                children: [
                  /// Heading
                  TSectionHeading(
                    title: 'Cattle Food',
                    onPressed: () {},
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      separatorBuilder: (context,index)=>const SizedBox(height: TSizes.spaceBtwItems),
                        itemBuilder: (context,index)=>const TProductCardHorizontal(),

                        itemCount: 4,
                    scrollDirection: Axis.horizontal,


                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
