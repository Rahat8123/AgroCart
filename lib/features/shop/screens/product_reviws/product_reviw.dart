import 'package:agrocart/features/shop/screens/product_reviws/widgets/user_reviw_card.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/rating/rating_indicator.dart';
import '../product_details/widgets/tProcessIndicator.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews and Ratings'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ratings and reviews are verified and are from people who use the same type of device that you use.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            /// Overall Product Ratings
            TOverallProductRating(),
            TRatingBarIndicator(rating:3.5),
            Text('12,611',style: Theme.of(context).textTheme.bodySmall,),
            const SizedBox(height: 16,),
            UserReviewCard(),
            UserReviewCard(),
            UserReviewCard(),
            UserReviewCard(),
          ],
        ),
      ),
    );
  }
}




