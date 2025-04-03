import 'package:agrocart/common/widget/section_heading/sectionheading.dart';
import 'package:agrocart/features/shop/screens/product_details/widgets/rating%20ShareWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:readmore/readmore.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'package:agrocart/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:agrocart/features/shop/screens/product_details/widgets/product_meta_data.dart';

import '../product_reviws/product_reviw.dart';


class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;
  String _selectedVariation = '250g';
  final Map<String, double> _variationPrices = {
    '250g': 5.99,
    '500g': 9.99,
    '1kg': 18.99,
    '5kg': 79.99,
  };

  double get _totalPrice => _variationPrices[_selectedVariation]! * _quantity;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TProductImageSlider(),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TRatingAndShare(),
                  const TProductMetaData(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  _VariationSelector(
                    selectedVariation: _selectedVariation,
                    variationPrices: _variationPrices,
                    onVariationChanged: (variation) {
                      setState(() => _selectedVariation = variation);
                    },
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  Text("Total Price: \$${_totalPrice.toStringAsFixed(2)}", style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  Text("Product Details", style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  ReadMoreText(
                      'This is a high-quality product made with the finest materials.',
                          trimLines: 4,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'show more',
                    trimExpandedText: 'Less',
                    moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                  ),
                  //Text("This is a high-quality product made with the finest materials.", style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSectionHeading(title: 'reviews(199)',onPressed:  () {Get.to(()=>ProductReviewScreen());},),
                  //const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _BottomBar(
        quantity: _quantity,
        onQuantityChanged: (newQuantity) {
          setState(() => _quantity = newQuantity);
        },
        totalPrice: _totalPrice,
      ),
    );
  }
}

class _VariationSelector extends StatelessWidget {
  final String selectedVariation;
  final Map<String, double> variationPrices;
  final ValueChanged<String> onVariationChanged;

  const _VariationSelector({
    required this.selectedVariation,
    required this.variationPrices,
    required this.onVariationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Select Variation", style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          children: variationPrices.keys.map((variation) {
            return ChoiceChip(
              label: Text(variation),
              selected: selectedVariation == variation,
              onSelected: (selected) {
                if (selected) onVariationChanged(variation);
              },
              selectedColor: Colors.blue.shade200,
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _BottomBar extends StatelessWidget {
  final int quantity;
  final ValueChanged<int> onQuantityChanged;
  final double totalPrice;

  const _BottomBar({
    required this.quantity,
    required this.onQuantityChanged,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle, color: Colors.red),
                onPressed: () {
                  if (quantity > 1) onQuantityChanged(quantity - 1);
                },
              ),
              Text("$quantity", style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold)),
              IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.green),
                onPressed: () {
                  onQuantityChanged(quantity + 1);
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              backgroundColor: Colors.blue.shade700,
              elevation: 8,
            ),
            child: Text("Add to Bag (\$${totalPrice.toStringAsFixed(2)})", style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
