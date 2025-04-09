import 'package:flutter/material.dart';

import '../../../common/brand/T_Breand_Card/T_Brand_card.dart';
import '../../../common/brandmodel/brandmodel.dart';
import '../../../common/widget/appbar/appbar.dart';
import '../../../common/widget/products.cart/sortable/TSortable.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
  // Replace with TSizes and other constants

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Cattle')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Brand Detail
              TBrandCard(showBorder: true,brand: BrandModel(
                name: "Acme",
                image: TImages.nikeLogo,
                productsCount: 50,
              ), ),

              const SizedBox(height: TSizes.spaceBtwSections),

              /// Product Sorting & List
              const TSortableProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
