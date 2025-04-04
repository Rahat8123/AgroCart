import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/layout/grid_layout.dart';
import '../../../../common/widget/products.cart/products_cards/product_card_vertical.dart';
import '../../../../utils/constants/sizes.dart';
   // Replace with your theme/constants file

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
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
        ),
      ),
    );
  }
}
