import 'package:agrocart/common/widget/Container/TRounded_COntainer.dart';
import 'package:agrocart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.selectedAddress});
  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress ? TColors.primary.withOpacity(0.85) : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
          ? TColors.darkerGrey
          : TColors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: const EdgeInsets.all(TSizes.defaultSpace), // Added padding to the container
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 5,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? (dark ? TColors.light : TColors.dark)
                  : null,
              size: 30, // Increased the size of the tick icon
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rahat',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: selectedAddress ? TColors.white : TColors.black,
                ),
              ),
              const SizedBox(height: TSizes.sm / 2),
              Text(
                '123456789',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: selectedAddress ? TColors.white : TColors.grey,
                ),
              ),
              const SizedBox(height: TSizes.sm / 2),
              Text(
                '82356 Rahat, Gobindaganj, Gaibandha',
                softWrap: true,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: selectedAddress ? TColors.white : TColors.grey,
                ),
              ),
              const SizedBox(height: TSizes.sm), // Additional space after address
              if (selectedAddress)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: TColors.primary.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Selected Address',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ], // Column children
          ),
        ],
      ),
    );
  }
}
