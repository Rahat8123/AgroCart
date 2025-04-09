import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/layout/grid_layout.dart';
import '../../../../common/widget/products.cart/products_cards/product_card_vertical.dart';
import '../../../../common/widget/products.cart/sortable/TSortable.dart';
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
        child: TSortableProduct(),
      ),
    );
  }
}


