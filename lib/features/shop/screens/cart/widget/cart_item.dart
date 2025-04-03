
import 'package:flutter/cupertino.dart';

import '../../../../../common/widget/products.cart/product_price_text.dart';
import '../../../../../common/widget/products.cart/products_cards/addremovebutton.dart';
import '../../../../../utils/constants/sizes.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
     this.showAddRemoveButton=true,
  });
final bool showAddRemoveButton;


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [
          TCartItem(),


         if(showAddRemoveButton) const SizedBox(height: TSizes.spaceBtwItems),


          if(showAddRemoveButton) const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensure that the Row doesn't expand unnecessarily
            children: [
              Row(
                children: [
                  SizedBox(width: 70,),
                  TProductQuantityWithAddRemove()
                ],
              ),
              TProductPriceText(price: '255'),
            ],
          ),


        ],
      ),
    );
  }
}
