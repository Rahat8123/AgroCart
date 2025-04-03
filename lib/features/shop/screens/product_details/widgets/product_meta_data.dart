import 'package:agrocart/features/shop/screens/product_details/widgets/productprice.dart';
import 'package:flutter/material.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/helpers/helper_functions.dart';
import '../../../../../common/widget/Container/TRounded_COntainer.dart';
import '../../../../../common/widget/image/t_circular_image.dart';
import '../../../../../common/widget/texts/product_title_text.dart';
import '../../../../../common/widget/texts/t_brand_title_text_with_verified_icon.dart';
import '../../../../../utils/constants/image_strings.dart';


class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.sm,
                vertical: TSizes.xs,
              ),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),

            const SizedBox(width: TSizes.spaceBtwItems),

            /// Original Price (Strikethrough)
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),

            const SizedBox(width: TSizes.spaceBtwItems),

            /// Discounted Price
            const TProductPriceText(price: '175', isLarge: true),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// Title
        const TProductTitleText(title: 'AdCET BOLUS', smallSize: false,),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const TProductTitleText(title: 'Status', smallSize: false),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ), // Row

        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            TCircularImage(
              image: TImages.cattle,
              width: 32,
              height: 32,
              // overlayColor: darkMode ? TColors.black : TColors.white,
              fit: BoxFit.cover,
            ), // TCircularImage
            TBrandTitleWithVerifiedIcon(title: 'Acme', ),
          ],
        ), // Row


      ],
    );
  }
}
