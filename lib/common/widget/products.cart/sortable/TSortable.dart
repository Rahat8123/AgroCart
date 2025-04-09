import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layout/grid_layout.dart';
import '../products_cards/product_card_vertical.dart';

class TSortableProduct extends StatelessWidget {
  const TSortableProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          /// Dropdown
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.sort),
            ),
            onChanged: (value) {},
            items: [
              'Name',
              'Higher Price',
              'Lower Price',
              'Sale',
              'Newest',
              'Popularity'
            ].map(
                  (option) => DropdownMenuItem(
                value: option,
                child: Text(option),
              ),
            ).toList(),
          ),

          const SizedBox(height: TSizes.spaceBtwSections),

          /// Products Grid
          TGridLayout(
            itemCount: 10, // example count
            itemBuilder: (_, index) => const TProductCardVertical(),
          ),
        ],
      ),
    );
  }
}