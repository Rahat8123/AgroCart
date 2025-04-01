import 'package:agrocart/common/widget/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../common/widget/image/rounded_image.dart';
import '../../../styles/shadows.dart';
import '../../Container/TRounded_COntainer.dart';
import '../../icons/T_Circular_Icon.dart';
import '../../texts/product_title_text.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// **Thumbnail, Wishlist Button, Discount Tag**
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// **Thumbnail Image**
                 const TRoundedImage(
                    imageUrl: TImages.productImage10,
                    applyImageRadius: true,
                  ),

                  /// **Discount Tag**
                  Positioned(
                    top: 12,
                    left: 8,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),

                  /// **Wishlist Button**
                  Positioned(
                    top: 8,
                    right: 8,
                    child: TCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),

            /// **Spacing**
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            /// **Details Section**
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm, right: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// **Product Title**
                  const TProductTitleText(
                      title: 'AdCet Bolus For Cow And Goat', smallSize: true),

                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  /// **Brand and Verified Icon**
                  TBrandTitleWithVerifiedIcon(title: 'ABVENT',brandTextSize: TextSizes.small,)

                ],
              ),
            ),

            Spacer(),

            /// **Price and Add-to-Cart Button**
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// **Price**
                Text(
                  '\$35.5',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                /// **Add-to-Cart Button**
                Container(
                  decoration: BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.cardRadiusMd),
                      bottomRight:
                      Radius.circular(TSizes.productImageRadius),
                    ),
                  ),
                  child: SizedBox(
                    width: TSizes.iconLg * 1,
                    height: TSizes.iconLg * 1,
                    child: const Center(
                      child: Icon(Iconsax.add, color: TColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
