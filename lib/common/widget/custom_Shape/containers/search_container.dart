import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon=Iconsax.search_normal,
    this.showBackground=true,
    this.showBorder=true, this.onTap,
    this.padding=const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
  });


  final String text;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool showBackground,showBorder;
  final EdgeInsetsGeometry padding;




  @override
  Widget build(BuildContext context) {

    final dark =THelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: EdgeInsets.all(TSizes.md), // Fixed TSizes usage
        decoration: BoxDecoration(
          color: showBackground?dark?TColors.dark:TColors.light:Colors.transparent,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          border:showBorder? Border.all(color: TColors.grey):null,
        ),
        child: Row(
          children: [
            const Icon(Iconsax.search_normal, color: TColors.darkerGrey),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              'Search in Store',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}