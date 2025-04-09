import 'package:agrocart/features/shop/brand/brandproduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/brand/T_Breand_Card/T_Brand_card.dart';
import '../../../common/brandmodel/brandmodel.dart';
import '../../../common/widget/appbar/appbar.dart';
import '../../../common/widget/layout/grid_layout.dart';
import '../../../common/widget/products.cart/sortable/TSortable.dart';
import '../../../common/widget/section_heading/sectionheading.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
   // Replace with TSizes, TColors, etc.

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Heading
              const TSectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Brands Grid
              TGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => TBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => const BrandProducts()), brand: BrandModel(
                  name: "Acme",
                  image: TImages.nikeLogo,
                  productsCount: 50,
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
