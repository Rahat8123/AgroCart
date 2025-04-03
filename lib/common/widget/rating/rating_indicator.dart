import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';

class TRatingBarIndicator extends StatelessWidget {
  final double rating;

  const TRatingBarIndicator({
    super.key,
    required this.rating, // Added required rating parameter
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      unratedColor: TColors.grey,
      itemBuilder: (_, __) => const Icon(Iconsax.star1, color: TColors.primary),
    );
  }
}
